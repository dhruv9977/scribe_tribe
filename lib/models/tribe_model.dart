class TribeModel {
  String? name;
  String? age;
  String? phone;
  String? email;
  String? city;
  String? state;
  String? address;
  String? pincode;
  List<String>? education;
  List<String>? preferredLanguages;
  String? gender;

  TribeModel(
      {this.name,
      this.age,
      this.phone,
      this.email,
      this.city,
      this.state,
      this.address,
      this.pincode,
      this.education,
      this.preferredLanguages,
      this.gender});

  TribeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    phone = json['phone'];
    email = json['email'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    pincode = json['pincode'];
    education = json['education'].cast<String>();
    preferredLanguages = json['preferredLanguages'].cast<String>();
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['education'] = this.education;
    data['preferredLanguages'] = this.preferredLanguages;
    data['gender'] = this.gender;
    return data;
  }
}
