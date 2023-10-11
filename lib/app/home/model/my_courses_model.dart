class MyCoursesModel {
  List<Courses>? courses;

  MyCoursesModel({this.courses});

  MyCoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  String? id;
  String? category;
  String? sortorder;
  String? shortname;
  String? fullname;
  String? idnumber;
  String? startdate;
  String? visible;
  String? defaultgroupingid;
  String? groupmode;
  String? groupmodeforce;
  String? overviewfiles;

  Courses(
      {this.id,
        this.category,
        this.sortorder,
        this.shortname,
        this.fullname,
        this.idnumber,
        this.startdate,
        this.visible,
        this.defaultgroupingid,
        this.groupmode,
        this.groupmodeforce,
        this.overviewfiles});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    sortorder = json['sortorder'];
    shortname = json['shortname'];
    fullname = json['fullname'];
    idnumber = json['idnumber'];
    startdate = json['startdate'];
    visible = json['visible'];
    defaultgroupingid = json['defaultgroupingid'];
    groupmode = json['groupmode'];
    groupmodeforce = json['groupmodeforce'];
    overviewfiles = json['overviewfiles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['sortorder'] = this.sortorder;
    data['shortname'] = this.shortname;
    data['fullname'] = this.fullname;
    data['idnumber'] = this.idnumber;
    data['startdate'] = this.startdate;
    data['visible'] = this.visible;
    data['defaultgroupingid'] = this.defaultgroupingid;
    data['groupmode'] = this.groupmode;
    data['groupmodeforce'] = this.groupmodeforce;
    data['overviewfiles'] = this.overviewfiles;
    return data;
  }
}
