class StudentDetailsModel {
  String? name;
  String? age;
  String? city;
  String? state;
  String? address;
  String? pincode;
  List<String>? education;
  String? gender;
  String? proof;
  String? phone;

  StudentDetailsModel({
    this.name,
    this.age,
    this.city,
    this.state,
    this.address,
    this.pincode,
    this.education,
    this.gender,
    this.proof,
    this.phone,
  });

  StudentDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    pincode = json['pincode'];
    education = json['education'].cast<String>();
    gender = json['gender'];
    proof = json['proof'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['education'] = this.education;
    data['gender'] = this.gender;
    data['proof'] = this.proof;
    data['phone'] = this.phone;
    return data;
  }
}
