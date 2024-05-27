class Report {
  int? policeReportId;
  String? policeReportBody;
  String? policeReportImage;
  String? policeReportImage2;
  String? policeReportImage3;
  String? policeReportLocation;
  int? policeReportStatus;
  String? policeReportTime;
  int? policeReportUser;

  Report(
      {this.policeReportId,
      this.policeReportBody,
      this.policeReportImage,
      this.policeReportImage2,
      this.policeReportImage3,
      this.policeReportLocation,
      this.policeReportStatus,
      this.policeReportTime,
      this.policeReportUser});

  Report.fromJson(Map<String, dynamic> json) {
    policeReportId = json['policeReport_id'];
    policeReportBody = json['policeReport_body'];
    policeReportImage = json['policeReport_image'];
    policeReportImage2 = json['policeReport_image2'];
    policeReportImage3 = json['policeReport_image3'];
    policeReportLocation = json['policeReport_location'];
    policeReportStatus = json['policeReport_status'];
    policeReportTime = json['policeReport_time'];
    policeReportUser = json['policeReport_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['policeReport_id'] = this.policeReportId;
    data['policeReport_body'] = this.policeReportBody;
    data['policeReport_image'] = this.policeReportImage;
    data['policeReport_image2'] = this.policeReportImage2;
    data['policeReport_image3'] = this.policeReportImage3;
    data['policeReport_location'] = this.policeReportLocation;
    data['policeReport_status'] = this.policeReportStatus;
    data['policeRepoer_time'] = this.policeReportTime;
    data['policeReport_user'] = this.policeReportUser;
    return data;
  }
}
