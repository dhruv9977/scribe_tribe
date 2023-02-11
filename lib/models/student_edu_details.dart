import 'package:scribetribe/data/repository/student_details_repo.dart';

class StudentEduDetails {

  String? centerCity;
  String? centerState;
  String? centerAddress;
  String? centerName;
  String? examSubject;
  String? examDate;
  int? examDuration;
  String? examTiming;
  String? examLanguage;
  String? needyId;

  StudentEduDetails(
      {this.centerCity,
      this.centerState,
      this.centerAddress,
      this.centerName,
      this.examSubject,
      this.examDate,
      this.examDuration,
      this.examTiming,
      this.examLanguage,
      this.needyId});

  StudentEduDetails.fromJson(Map<String, dynamic> json) {
    centerCity = json['centerCity'];
    centerState = json['centerState'];
    centerAddress = json['centerAddress'];
    centerName = json['centerName'];
    examSubject = json['examSubject'];
    examDate = json['examDate'];
    examDuration = json['examDuration'];
    examTiming = json['examTiming'];
    examLanguage = json['examLanguage'];
    needyId = json['needyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['centerCity'] = this.centerCity;
    data['centerState'] = this.centerState;
    data['centerAddress'] = this.centerAddress;
    data['centerName'] = this.centerName;
    data['examSubject'] = this.examSubject;
    data['examDate'] = this.examDate;
    data['examDuration'] = this.examDuration;
    data['examTiming'] = this.examTiming;
    data['examLanguage'] = this.examLanguage;
    data['needyId'] = this.needyId;
    return data;
  }
}
