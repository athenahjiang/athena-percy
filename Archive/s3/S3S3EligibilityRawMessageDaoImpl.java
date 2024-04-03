package com.athenahealth.collector.fdp.eligibility.dao;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.transfer.MultipleFileUpload;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import com.athenahealth.collector.fdp.eligibility.dto.EligibilityTrack;
import com.athenahealth.collector.fdp.eligibility.util.FileCompressor;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.omg.CORBA.portable.UnknownException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.core.ResponseInputStream;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.GetObjectResponse;
import software.amazon.awssdk.services.s3.model.NoSuchKeyException;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;
import software.amazon.awssdk.services.s3.model.ServerSideEncryption;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.GetObjectPresignRequest;
import software.amazon.awssdk.services.s3.presigner.model.PresignedGetObjectRequest;
import software.amazon.awssdk.transfer.s3.S3TransferManager;
import software.amazon.awssdk.transfer.s3.model.CompletedDirectoryUpload;
import software.amazon.awssdk.transfer.s3.model.CompletedFileUpload;
import software.amazon.awssdk.transfer.s3.model.DirectoryUpload;
import software.amazon.awssdk.transfer.s3.model.FileUpload;
import software.amazon.awssdk.transfer.s3.model.UploadDirectoryRequest;
import software.amazon.awssdk.transfer.s3.model.UploadFileRequest;
import software.amazon.awssdk.transfer.s3.progress.LoggingTransferListener;

@Repository
public class S3S3EligibilityRawMessageDaoImpl implements S3EligibilityRawMessageDao {

  private final S3Client s3Client;
  private final S3Presigner s3Presigner;

  private final S3TransferManager dataFabricS3TransferManager;

  private final AmazonS3 stsAmazonS3;

  @Autowired
  public S3S3EligibilityRawMessageDaoImpl(
      @Autowired S3Client dataFabricS3Client,
      @Autowired S3Presigner s3Presigner,
      @Autowired S3TransferManager dataFabricS3TransferManager,
      @Autowired AmazonS3 stsAmazonS3) {
    this.s3Client = dataFabricS3Client;
    this.s3Presigner = s3Presigner;
    this.dataFabricS3TransferManager = dataFabricS3TransferManager;
    this.stsAmazonS3 = stsAmazonS3;
  }

  @Override
  public void transferEligibilityRawMessageListV2(
      long contextId, long patientId, List<EligibilityTrack> tracks) {

    UploadFileRequest uploadFileRequest =
        UploadFileRequest.builder()
            .putObjectRequest(
                b ->
                    b.bucket("eligsvc-eligmessages-percy-test")
                        .key("foo/bar/a.txt")
                        .serverSideEncryption(ServerSideEncryption.AES256))
            .addTransferListener(LoggingTransferListener.create())
            .source(Paths.get("C:\\Users\\hjiang\\Downloads\\a.txt"))
            .build();
    FileUpload fileUpload = dataFabricS3TransferManager.uploadFile(uploadFileRequest);
    CompletedFileUpload uploadResult = fileUpload.completionFuture().join();
    System.out.println("percy: uploadResult: " + uploadResult.response().eTag());

    DirectoryUpload directoryUpload =
        dataFabricS3TransferManager.uploadDirectory(
            UploadDirectoryRequest.builder()
                .source(Paths.get("C:\\Users\\hjiang\\Downloads"))
                .bucket("eligsvc-eligmessages-percy-test")
                .build());
    CompletedDirectoryUpload completedDirectoryUpload = directoryUpload.completionFuture().join();
    System.out.println("percy: completedDirectoryUpload: " + completedDirectoryUpload.toString());
  }

  @Override
  public void transferEligibilityRawMessageListV1(
      long contextId, long patientId, List<EligibilityTrack> tracks) {
    List<File> files = getEligibilityRawMessageFiles(tracks);

    TransferManager transferManager =
        TransferManagerBuilder.standard().withS3Client(stsAmazonS3).build();

    MultipleFileUpload upload =
        transferManager.uploadFileList(
            "eligsvc-eligmessages-percy-test",
            contextId + "/" + patientId + "/",
            new File("."),
            files);

    try {
      upload.waitForCompletion();
      deleteEligibilityRawMessageFiles(tracks);
    } catch (InterruptedException e) {
      System.out.println("percy: e: " + e);
      throw new RuntimeException(e);
    }
  }

  private List<File> getEligibilityRawMessageFiles(List<EligibilityTrack> tracks) {
    List<File> files = new ArrayList<>();
    for (EligibilityTrack track : tracks) {
      try {
        String reqPath = "./" + track.getEligibilityTrackId() + "/270.gz";
        String resPath = "./" + track.getEligibilityTrackId() + "/271.gz";

        byte[] req = FileCompressor.compressToGZip(track.getOutgoingRequest());
        byte[] res = FileCompressor.compressToGZip(track.getIncomingResponse());

        if (req != null) FileUtils.writeByteArrayToFile(new File(reqPath), req);
        if (res != null) FileUtils.writeByteArrayToFile(new File(resPath), res);

        files.add(new File(reqPath));
        files.add(new File(resPath));
      } catch (IOException e) {
        throw new RuntimeException(e);
      }
    }
    return files;
  }

  private void deleteEligibilityRawMessageFiles(List<EligibilityTrack> tracks) {
    List<File> unDeletedFiles = new ArrayList<>();

    for (EligibilityTrack track : tracks) {
      String trackPath = "./" + track.getEligibilityTrackId();
      File trackDir = new File(trackPath);
      File reqFile = new File(trackPath + "/270.gz");
      File resFile = new File(trackPath + "/271.gz");

      if (reqFile.exists() && !reqFile.delete()) unDeletedFiles.add(reqFile);
      if (resFile.exists() && !resFile.delete()) unDeletedFiles.add(resFile);
      if (trackDir.exists() && !trackDir.delete()) unDeletedFiles.add(trackDir);
    }

    if (unDeletedFiles.size() > 0) {
      System.out.println("percy: unDeletedFiles: " + unDeletedFiles);
    }
  }

  @Override
  public void putEligibilityRawMessage(
      long contextId, long patientId, long trackId, String messageType, String message) {
    try {
      PutObjectRequest putRequest =
          PutObjectRequest.builder()
              .bucket("eligsvc-eligibility-1-947726-dev")
              .key(createObjectKey(contextId, patientId, trackId, messageType))
              .serverSideEncryption(ServerSideEncryption.AES256)
              .contentType("text/plain")
              .contentEncoding("gzip")
              .build();
      if (message == null) {
        s3Client.putObject(putRequest, RequestBody.empty());
      } else {
        s3Client.putObject(
            putRequest, RequestBody.fromBytes(FileCompressor.compressToGZip(message)));
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public String getEligibilityRawMessage(
      long contextId, long patientId, long trackId, String messageType) {
    try {
      GetObjectRequest getObjectRequest =
          GetObjectRequest.builder()
              .bucket("eligsvc-eligmessages-percy-test")
              .key(createObjectKey(contextId, patientId, trackId, messageType))
              .build();
      ResponseInputStream<GetObjectResponse> response = s3Client.getObject(getObjectRequest);
      return FileCompressor.decompressFromGZip(response.readAllBytes());
    } catch (NoSuchKeyException e) {
      System.out.println("percy: NoSuchKeyException: " + e);
      return null;
    } catch (IOException e) {
      throw new UnknownException(e);
    }
  }

  @Override
  public String getS3Url(long contextId, long patientId, long trackId, String messageType) {
    try {
      String bucket = "eligsvc-eligmessages-percy-test";
      String path = createObjectKey(contextId, patientId, trackId, messageType);

      GetObjectRequest getObjectRequest =
          GetObjectRequest.builder().bucket(bucket).key(path).build();

      GetObjectPresignRequest getObjectPresignRequest =
          GetObjectPresignRequest.builder()
              .signatureDuration(Duration.ofMinutes(60))
              .getObjectRequest(getObjectRequest)
              .build();

      PresignedGetObjectRequest presignedGetObjectRequest =
          s3Presigner.presignGetObject(getObjectPresignRequest);

      return presignedGetObjectRequest.url().toString();
    } catch (S3Exception e) {
      System.out.println("percy: S3Exception: " + e);
    }
    return "";
  }

  private String createObjectKey(long contextId, long patientId, long trackId, String messageType) {
    return String.join(
        "/",
        String.valueOf(contextId),
        String.valueOf(patientId),
        String.valueOf(trackId),
        messageType + ".gz");
  }
}
