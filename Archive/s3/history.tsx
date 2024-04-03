const s3Url =
  type === "request"
    ? rowObject.rowData.outgoingRequestS3Url
    : rowObject.rowData.incomingResponseS3Url;
if (s3Url) {
  axios
    .get(s3Url, {
      headers: {
        "Content-Type": "text/plain",
        "Content-Encoding": "gzip"
      }
    })
    .then(res => {
      openLightbox({
        TYPE: type,
        DATEOFSERVICE:
          rowObject &&
          rowObject.rowData &&
          rowObject.rowData.dateOfService,
        DATATODISPLAY: res.data
      });
    })
    .catch(err => {
      openLightbox({
        TYPE: type,
        DATEOFSERVICE:
          rowObject &&
          rowObject.rowData &&
          rowObject.rowData.dateOfService,
        DATATODISPLAY: err
      });
    });
}