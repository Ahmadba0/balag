class ReplayModel {
  int? policereplayId;
  String? policereplayText;
  String? policereplayTime;
  int? policereplayReport;

  ReplayModel(
      {this.policereplayId,
      this.policereplayText,
      this.policereplayReport,
      this.policereplayTime});

  ReplayModel.fromJson(Map<String, dynamic> json) {
    policereplayId = json['policereplay_id'];
    policereplayText = json['policereplay_text'];
    policereplayTime = json['policereplay_time'];
    policereplayReport = json['policereplay_report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['policereplay_id'] = this.policereplayId;
    data['policereplay_text'] = this.policereplayText;
    data['policereplay_time'] = this.policereplayTime;
    data['policereplay_report'] = this.policereplayReport;
    return data;
  }
}
