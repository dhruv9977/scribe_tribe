class ModelDetail2 {
  String? sId;
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
  bool? postStatus;

  ModelDetail2(
      {this.sId,
      this.centerCity,
      this.centerState,
      this.centerAddress,
      this.centerName,
      this.examSubject,
      this.examDate,
      this.examDuration,
      this.examTiming,
      this.examLanguage,
      this.needyId,
      this.postStatus});

  ModelDetail2.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    postStatus = json['postStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['postStatus'] = this.postStatus;
    return data;
  }
}



class ModelDetail3 {
  String? examPostId;
  String? writerId;

  ModelDetail3({this.examPostId, this.writerId});

  ModelDetail3.fromJson(Map<String, dynamic> json) {
    examPostId = json['examPostId'];
    writerId = json['writerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examPostId'] = this.examPostId;
    data['writerId'] = this.writerId;
    return data;
  }
}
