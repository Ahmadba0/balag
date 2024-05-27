class RatingModel {
  int? ratingId;
  int? ratingValue;
  String? ratingPeriod;
  int? ratingUserid;
  int? ratingReportid;

  RatingModel(
      {this.ratingId,
      this.ratingValue,
      this.ratingPeriod,
      this.ratingUserid,
      this.ratingReportid});

  RatingModel.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    ratingValue = json['rating_value'];
    ratingPeriod = json['rating_period'];
    ratingUserid = json['rating_userid'];
    ratingReportid = json['rating_reportid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_id'] = this.ratingId;
    data['rating_value'] = this.ratingValue;
    data['rating_period'] = this.ratingPeriod;
    data['rating_userid'] = this.ratingUserid;
    data['rating_reportid'] = this.ratingReportid;
    return data;
  }
}
