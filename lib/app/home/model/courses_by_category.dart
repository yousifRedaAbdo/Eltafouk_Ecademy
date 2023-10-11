class CoursesByCatogeryModel {
  List<DataCourses>? data;

  CoursesByCatogeryModel({this.data});

  CoursesByCatogeryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataCourses>[];
      json['data'].forEach((v) {
        data!.add(new DataCourses.fromJson(v));
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

class DataCourses {
  String? id;
  String? fullname;
  List<Overviewfiles>? overviewfiles;
  List<Contacts>? contacts;

  DataCourses({this.id, this.fullname, this.overviewfiles, this.contacts});

  DataCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    if (json['overviewfiles'] != null) {
      overviewfiles = <Overviewfiles>[];
      json['overviewfiles'].forEach((v) {
        overviewfiles!.add(new Overviewfiles.fromJson(v));
      });
    }
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    if (this.overviewfiles != null) {
      data['overviewfiles'] =
          this.overviewfiles!.map((v) => v.toJson()).toList();
    }
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Overviewfiles {
  String? filename;
  String? fileurl;
  String? filesize;
  String? filepath;
  String? mimetype;
  String? timemodified;

  Overviewfiles(
      {this.filename,
        this.fileurl,
        this.filesize,
        this.filepath,
        this.mimetype,
        this.timemodified});

  Overviewfiles.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    fileurl = json['fileurl'];
    filesize = json['filesize'];
    filepath = json['filepath'];
    mimetype = json['mimetype'];
    timemodified = json['timemodified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['fileurl'] = this.fileurl;
    data['filesize'] = this.filesize;
    data['filepath'] = this.filepath;
    data['mimetype'] = this.mimetype;
    data['timemodified'] = this.timemodified;
    return data;
  }
}

class Contacts {
  String? id;
  String? fullname;
  String? coursename;

  Contacts({this.id, this.fullname, this.coursename});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    coursename = json['coursename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['coursename'] = this.coursename;
    return data;
  }
}
