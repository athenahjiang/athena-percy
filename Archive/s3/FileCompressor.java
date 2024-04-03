package com.athenahealth.collector.fdp.eligibility.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class FileCompressor {
  public static byte[] compressToGZip(final String str) throws IOException {
    if ((str == null) || (str.isEmpty())) return null;

    ByteArrayOutputStream obj = new ByteArrayOutputStream();
    GZIPOutputStream gzip = new GZIPOutputStream(obj);
    gzip.write(str.getBytes(StandardCharsets.UTF_8));
    gzip.flush();
    gzip.close();
    return obj.toByteArray();
  }

  public static String decompressFromGZip(final byte[] compressed) throws IOException {
    if ((compressed == null) || (compressed.length == 0)) return "";

    final StringBuilder outStr = new StringBuilder();
    if (isCompressed(compressed)) {
      final GZIPInputStream gis = new GZIPInputStream(new ByteArrayInputStream(compressed));
      final BufferedReader bufferedReader =
          new BufferedReader(new InputStreamReader(gis, StandardCharsets.UTF_8));

      String line;
      while ((line = bufferedReader.readLine()) != null) {
        outStr.append(line);
      }
    } else {
      outStr.append(Arrays.toString(compressed));
    }
    return outStr.toString();
  }

  public static boolean isCompressed(final byte[] compressed) {
    return (compressed[0] == (byte) (GZIPInputStream.GZIP_MAGIC))
        && (compressed[1] == (byte) (GZIPInputStream.GZIP_MAGIC >> 8));
  }
}
