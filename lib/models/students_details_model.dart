class StudentsDetailsModels {
  String? mobile;
  String? name;
  int? age;
  String? examname;
  String? subjectname;
  String? examlanguage;
  String? examdate;
  String? examtime;
  int? examduration;
  String? examcity;
  String? examarea;
  bool? commuteToWriter;

  StudentsDetailsModels(
      {this.mobile,
      this.name,
      this.age,
      this.examname,
      this.subjectname,
      this.examlanguage,
      this.examdate,
      this.examtime,
      this.examduration,
      this.examcity,
      this.examarea,
      this.commuteToWriter});

  StudentsDetailsModels.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
    age = json['age'];
    examname = json['examname'];
    subjectname = json['subjectname'];
    examlanguage = json['examlanguage'];
    examdate = json['examdate'];
    examtime = json['examtime'];
    examduration = json['examduration'];
    examcity = json['examcity'];
    examarea = json['examarea'];
    commuteToWriter = json['commuteToWriter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['name'] = name;
    data['age'] = age;
    data['examname'] = examname;
    data['subjectname'] = subjectname;
    data['examlanguage'] = examlanguage;
    data['examdate'] = examdate;
    data['examtime'] = examtime;
    data['examduration'] = examduration;
    data['examcity'] = examcity;
    data['examarea'] = examarea;
    data['commuteToWriter'] = commuteToWriter;
    return data;
  }
}
