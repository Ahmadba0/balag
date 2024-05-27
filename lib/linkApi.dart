class linkApi {
  //emulator
  static const String server = "http://10.0.2.2/balag";
  //لابتوب عم يبث
  //static const String server = "http://192.168.137.1/balag";
  //a50 عم يبث
  //static const String server = "http://192.168.1.9/balag";
  //super عم يبث
  //static const String server = "http://192.168.1.7/balag";
  //hero
  //static const String server = "http://192.168.1.106/balag";
  //sara
  //static const String server = "http://192.168.1.14/balag";

  //
  static const String linkImage = "http://10.0.2.2/balag/upload";
  //static const String linkImage = "http://192.168.1.7/balag/upload";
  //static const String linkImage = "http://192.168.151.41/balag/upload";
  //static const String linkImage = "http://192.168.1.12/balag/upload";
  //static const String linkImage = "http://192.168.1.106/balag/upload";

  static const String info = "$server/info/info.php";
  static const String infoGet = "$server/info/infoGet.php";

  static const String location = "$server/location/location.php";

  static const String addPoliceReportwithoutimg =
      "$server/policeReport/addreportwithoutimg.php";

  static const String addPoliceReport = "$server/policeReport/addReport.php";
  static const String addMuniReport = "$server/munireport/addReport.php";
  static const String addImageTwoToReport =
      "$server/policeReport/addImageTwoToReport.php";

  static const String addImageThreeToReport =
      "$server/policeReport/addImageThreeToReport.php";

  //delete
  static const String delete = "$server/policeReport/deleteReport.php";
  static const String deleteimg2 = "$server/policeReport/deleteimg2.php";
  static const String deleteimg3 = "$server/policeReport/deleteimg3.php";

  static const String getPoliceReport = "$server/policeReport/viewReport.php";
  static const String getMuniReport = "$server/munireport/viewReport.php";

  static const String updatePoliceReport =
      "$server/policeReport/updateReport.php";

  static const String details = "$server/policeReport/details.php";

  //replay
  static const String viewReplay = "$server/policeReplay/viewReplay.php";

  static const String viewNotification =
      "$server/notification/viewNotification.php";

  //profile

  static const String viewProfile = "$server/profile/view.php";

  //updatephone
  static const String updatephone = "$server/profile/updatephone.php";
  //updatecity
  static const String updatecity = "$server/profile/updatecity.php";

  //--------------rating
  //add
  static const String addrating = "$server/rating/addrating.php";
  //get
  static const String getrating = "$server/rating/getrating.php";

  //view call up
  static const String viewcallup = "$server/callupforuser/viewcallup.php";

  static const String viewresolution =
      "$server/resolutionforuser/viewresolution.php";

  //verify signup
  static const String verifySignup = "$server/info/verifycodesignup.php";
  static const String resendSignup = "$server/info/resend.php";
  static const String checkphone = "$server/info/checkemail.php";
  static const String verifycodeForget = "$server/info/verifycode.php";
  static const String resetpassword = "$server/info/resetpassword.php";

  //getverifycode
  static const String getverifycode = "$server/info/getverifycode.php";

  static const addimgprofile = "$server/info/addimg.php";

  //insert verify code
  static const insertVerify = "$server/info/insertverify.php";

  static const deleteandupdate = "$server/info/deleteandupdate.php";
}
