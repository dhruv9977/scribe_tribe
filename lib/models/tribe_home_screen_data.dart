//in model define all the variables with their datatype
//in controller export the model and require it and then perform all the crud operations
//then export the controller and use it in the main.dart

class TribeHomeScreenData {
  String? name;
  int? age;
  String? destination;
  String? date;
  String? requirement;

  TribeHomeScreenData(
      {this.name, this.age, this.destination, this.date, this.requirement});

  TribeHomeScreenData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    destination = json['destination'];
    date = json['date'];
    requirement = json['requirement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['destination'] = destination;
    data['date'] = date;
    data['requirement'] = requirement;
    return data;
  }
}
