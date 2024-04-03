package com.athenahealth.collector.fdp.eligibility.dao;

import com.athenahealth.collector.fdp.eligibility.dto.EligibilityTrack;
import java.util.List;

public interface S3EligibilityRawMessageDao {
  void putEligibilityRawMessage(
      long contextId, long patientId, long trackId, String messageType, String message);

  String getEligibilityRawMessage(long contextId, long patientId, long trackId, String messageType);

  void transferEligibilityRawMessageListV1(
      long contextId, long patientId, List<EligibilityTrack> tracks);

  void transferEligibilityRawMessageListV2(
      long contextId, long patientId, List<EligibilityTrack> tracks);

  String getS3Url(long contextId, long patientId, long trackId, String messageType);
}
