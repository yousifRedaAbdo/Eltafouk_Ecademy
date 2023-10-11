class ProfileTeacherModel {
  String? image;
  String? fullname;

  ProfileTeacherModel({this.image, this.fullname});

  ProfileTeacherModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['fullname'] = this.fullname;
    return data;
  }
}
