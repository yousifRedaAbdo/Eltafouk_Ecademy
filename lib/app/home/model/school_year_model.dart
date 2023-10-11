class SchoolYearsModel {
  List<DataSchoolYear>? data;

  SchoolYearsModel({this.data});

  SchoolYearsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataSchoolYear>[];
      json['data'].forEach((v) {
        data!.add(new DataSchoolYear.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSchoolYear {
  String? name;
  String? id;
  String? description;

  DataSchoolYear({this.name, this.id, this.description});

  DataSchoolYear.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}
