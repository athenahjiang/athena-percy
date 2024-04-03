public class DateOfServiceResponse {
  private String error;
  private Long patientId;
  private Long patientInsuranceId;
  private List<ServiceDateByStc> serviceTypeCodes;
}

public class ServiceDateByStc {
  private String code;
  private List<InquiryDateByServiceDate> datesOfService;
}

public class InquiryDateByServiceDate {
  private String dateOfService;
  private List<DateOfInquiryDetails> datesOfInquiry;
}

public class DateOfInquiryDetails {
  private String dateOfInquiry;
  private String checkedBy;
  private Long eligibilityTrackId;
}

public List<ServiceDateByStc> getDatesOfService(
  long contextId, long patientId, long patientInsuranceId, String serviceTypeCode) {

    String query =
        "SELECT benefits.service_type_code,track.date_of_service,track.date_of_inquiry, "
            + "track.eligibility_track_id,track.checked_by "
            + "FROM anet_eligibility_track AS track "
            + "LEFT JOIN eligibility_request AS request "
            + "ON (request.context_id = track.context_id "
            + "AND request.eligibility_track_id = track.eligibility_track_id) "
            + "INNER JOIN anet_eligibility_benefits AS benefits "
            + "ON track.id = benefits.anet_eligibility_track_id "
            + "WHERE track.context_id=? "
            + "AND track.patient_id=? "
            + "AND ? IN (track.patient_insurance_id,request.patientinsurance_id) "
            + (serviceTypeCode == null ? "" : "AND service_type_code='" + serviceTypeCode + "' ")
            + "ORDER BY benefits.service_type_code, "
            + "track.date_of_service DESC, "
            + "track.date_of_inquiry DESC, "
            + "track.eligibility_track_id DESC "
            + ";";

    List<Map<String, Object>> rows =
        jdbcTemplate.queryForList(query, contextId, patientId, patientInsuranceId);

    return rowMapper.mapRowsToDosByStcList(rows);
}

//  stcList: [
//    stcObject: {
//      code: String,
//      dosList: [
//        dosObject: {
//          dos: String,
//          doiList: [
//            doiObject: { doi, checkedBy, trackId, },
//          ]
//        },
//      ]
//    },
//  ]
public List<ServiceDateByStc> mapRowsToDosByStcList(List<Map<String, Object>> rows) {

    List<ServiceDateByStc> stcList = new ArrayList<>();
    for (int i = 0; i < rows.size(); i++) {
      Map<String, Object> row = rows.get(i);
      Map<String, Object> lastRow = i > 0 ? rows.get(i - 1) : null;

      // stc
      String stc = getStcCodeFromRow(row);
      String lastStc = ColumnGetter.getStringFromRow(lastRow, ColumnNames.SERVICE_TYPE_CODE);
      if (stc == null) {
        continue;
      }

      // dos
      String dos = ColumnGetter.getStringFromRow(row, ColumnNames.DATE_OF_SERVICE);
      String lastDos = ColumnGetter.getStringFromRow(lastRow, ColumnNames.DATE_OF_SERVICE);
      if (dos == null) {
        continue;
      }

      // doi
      String doi = ColumnGetter.getStringFromRow(row, ColumnNames.DATE_OF_INQUIRY);
      Long trackId = ColumnGetter.getLongFromRow(row, ColumnNames.ELIGIBILITY_TRACK_ID);
      String checkedBy = ColumnGetter.getStringFromRow(row, ColumnNames.CHECKED_BY);
      DateOfInquiryDetails newDoiObject =
          DateOfInquiryDetails.builder()
              .dateOfInquiry(doi)
              .eligibilityTrackId(trackId)
              .checkedBy(checkedBy)
              .build();

      if (stc.equals(lastStc)) { // existing stc
        ServiceDateByStc lastStcObject = stcList.get(stcList.size() - 1);
        List<InquiryDateByServiceDate> dosList = lastStcObject.getDatesOfService();

        if (dos.equals(lastDos)) { // existing dos
          InquiryDateByServiceDate lastDosObject = dosList.get(dosList.size() - 1);
          List<DateOfInquiryDetails> doiList = lastDosObject.getDatesOfInquiry();
          doiList.add(newDoiObject);
        } else { // new dos
          dosList.add(createNewDosObject(dos, newDoiObject));
        }
      } else { // new stc
        stcList.add(createNewStcObject(stc, createNewDosObject(dos, newDoiObject)));
      }
    }

    return stcList;
}

private InquiryDateByServiceDate createNewDosObject(String dos, DateOfInquiryDetails doiObject) {
    return InquiryDateByServiceDate.builder()
        .dateOfService(dos)
        .datesOfInquiry(new ArrayList<>(List.of(doiObject)))
        .build();
}

private ServiceDateByStc createNewStcObject(String stc, InquiryDateByServiceDate dosObject) {
    return ServiceDateByStc.builder()
        .code(stc)
        .datesOfService(new ArrayList<>(List.of(dosObject)))
        .build();
}
