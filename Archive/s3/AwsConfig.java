package com.athenahealth.collector.fdp.eligibility.configuration;

import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicSessionCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.securitytoken.AWSSecurityTokenService;
import com.amazonaws.services.securitytoken.AWSSecurityTokenServiceAsyncClientBuilder;
import com.amazonaws.services.securitytoken.model.AssumeRoleResult;
import com.amazonaws.services.securitytoken.model.Credentials;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.services.s3.S3AsyncClient;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.S3Configuration;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.sts.StsClient;
import software.amazon.awssdk.services.sts.auth.StsAssumeRoleCredentialsProvider;
import software.amazon.awssdk.services.sts.model.AssumeRoleRequest;
import software.amazon.awssdk.transfer.s3.S3TransferManager;

@Configuration
public class AwsConfig {

  @Bean
  public AwsCredentialsProvider defaultAwsCredentialsProvider() {
    return DefaultCredentialsProvider.builder().build();
  }

  @Bean
  public AwsCredentialsProvider stsCredentialProvider(
      @Autowired AwsCredentialsProvider defaultAwsCredentialsProvider,
      @Value("${aws.role-arn}") String roleArn) {
    StsClient stsClient =
        StsClient.builder().credentialsProvider(defaultAwsCredentialsProvider).build();

    AssumeRoleRequest assumeRoleRequest =
        AssumeRoleRequest.builder()
            .roleArn(String.join("", roleArn, "eligsvc-eligibility-1-947726-dev"))
            .roleSessionName("percyTestRoleSessionName")
            .build();

    return StsAssumeRoleCredentialsProvider.builder()
        .stsClient(stsClient)
        .refreshRequest(assumeRoleRequest)
        .build();
  }

  @Bean
  public S3Client dataFabricS3Client(@Autowired AwsCredentialsProvider stsCredentialProvider) {
    return S3Client.builder().credentialsProvider(stsCredentialProvider).build();
  }

  @Bean
  public S3Presigner s3Presigner() {
    return S3Presigner.builder()
        .serviceConfiguration(S3Configuration.builder().checksumValidationEnabled(false).build())
        .build();
  }

  @Bean
  public S3TransferManager dataFabricS3TransferManager(
      @Autowired AwsCredentialsProvider stsCredentialProvider) {
    S3AsyncClient dataFabricS3AsyncClient =
        S3AsyncClient.crtBuilder().credentialsProvider(stsCredentialProvider).build();
    return S3TransferManager.builder().s3Client(dataFabricS3AsyncClient).build();
  }

  @Bean
  public AmazonS3 amazonS3() {
    return AmazonS3ClientBuilder.standard().withRegion(Regions.US_EAST_1).build();
  }

  @Bean
  public AmazonS3 stsAmazonS3(@Value("${aws.role-arn}") String roleArn) {

    AWSSecurityTokenService stsClient =
        AWSSecurityTokenServiceAsyncClientBuilder.standard()
            .withCredentials(new ProfileCredentialsProvider("saml"))
            .withRegion(Regions.US_EAST_1)
            .build();
    com.amazonaws.services.securitytoken.model.AssumeRoleRequest assumeRoleRequest =
        new com.amazonaws.services.securitytoken.model.AssumeRoleRequest()
            .withDurationSeconds(3600)
            .withRoleArn(String.join("", roleArn, "eligsvc-eligibility-1-947726-dev_rw"))
            .withRoleSessionName("percyTestRoleSessionName");
    AssumeRoleResult assumeRoleResult = stsClient.assumeRole(assumeRoleRequest);
    Credentials credentials = assumeRoleResult.getCredentials();

    AWSCredentialsProvider credentialsProvider =
        new AWSStaticCredentialsProvider(
            new BasicSessionCredentials(
                credentials.getAccessKeyId(),
                credentials.getSecretAccessKey(),
                credentials.getSessionToken()));

    return AmazonS3ClientBuilder.standard()
        .withRegion(Regions.US_EAST_1)
        .withCredentials(credentialsProvider)
        .build();
  }
}
