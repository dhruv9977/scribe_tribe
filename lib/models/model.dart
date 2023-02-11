class ModelDetails {
  String? writerId;

  ModelDetails({this.writerId});

  ModelDetails.fromJson(Map<String, dynamic> json) {
    writerId = json['writerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['writerId'] = this.writerId;
    return data;
  }
}
