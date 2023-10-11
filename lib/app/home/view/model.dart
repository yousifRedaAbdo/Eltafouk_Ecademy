class HomeModel {
  List<Message>? message;

  HomeModel({this.message});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? id;
  String? auth;
  String? confirmed;
  String? policyagreed;
  String? deleted;
  String? suspended;
  String? mnethostid;
  String? username;
  String? password;
  String? idnumber;
  String? firstname;
  String? lastname;
  String? email;
  String? emailstop;
  String? phone1;
  String? phone2;
  String? institution;
  String? department;
  String? address;
  String? city;
  String? country;
  String? lang;
  String? calendartype;
  String? theme;
  String? timezone;
  String? firstaccess;
  String? lastaccess;
  String? lastlogin;
  String? currentlogin;
  String? lastip;
  String? secret;
  String? picture;
  String? description;
  String? descriptionformat;
  String? mailformat;
  String? maildigest;
  String? maildisplay;
  String? autosubscribe;
  String? trackforums;
  String? timecreated;
  String? timemodified;
  String? trustbitmask;
  String? imagealt;
  String? lastnamephonetic;
  String? firstnamephonetic;
  String? middlename;
  String? alternatename;
  Null? moodlenetprofile;
  String? src;

  Message(
      {this.id,
        this.auth,
        this.confirmed,
        this.policyagreed,
        this.deleted,
        this.suspended,
        this.mnethostid,
        this.username,
        this.password,
        this.idnumber,
        this.firstname,
        this.lastname,
        this.email,
        this.emailstop,
        this.phone1,
        this.phone2,
        this.institution,
        this.department,
        this.address,
        this.city,
        this.country,
        this.lang,
        this.calendartype,
        this.theme,
        this.timezone,
        this.firstaccess,
        this.lastaccess,
        this.lastlogin,
        this.currentlogin,
        this.lastip,
        this.secret,
        this.picture,
        this.description,
        this.descriptionformat,
        this.mailformat,
        this.maildigest,
        this.maildisplay,
        this.autosubscribe,
        this.trackforums,
        this.timecreated,
        this.timemodified,
        this.trustbitmask,
        this.imagealt,
        this.lastnamephonetic,
        this.firstnamephonetic,
        this.middlename,
        this.alternatename,
        this.moodlenetprofile,
        this.src});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auth = json['auth'];
    confirmed = json['confirmed'];
    policyagreed = json['policyagreed'];
    deleted = json['deleted'];
    suspended = json['suspended'];
    mnethostid = json['mnethostid'];
    username = json['username'];
    password = json['password'];
    idnumber = json['idnumber'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    emailstop = json['emailstop'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    institution = json['institution'];
    department = json['department'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    lang = json['lang'];
    calendartype = json['calendartype'];
    theme = json['theme'];
    timezone = json['timezone'];
    firstaccess = json['firstaccess'];
    lastaccess = json['lastaccess'];
    lastlogin = json['lastlogin'];
    currentlogin = json['currentlogin'];
    lastip = json['lastip'];
    secret = json['secret'];
    picture = json['picture'];
    description = json['description'];
    descriptionformat = json['descriptionformat'];
    mailformat = json['mailformat'];
    maildigest = json['maildigest'];
    maildisplay = json['maildisplay'];
    autosubscribe = json['autosubscribe'];
    trackforums = json['trackforums'];
    timecreated = json['timecreated'];
    timemodified = json['timemodified'];
    trustbitmask = json['trustbitmask'];
    imagealt = json['imagealt'];
    lastnamephonetic = json['lastnamephonetic'];
    firstnamephonetic = json['firstnamephonetic'];
    middlename = json['middlename'];
    alternatename = json['alternatename'];
    moodlenetprofile = json['moodlenetprofile'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auth'] = this.auth;
    data['confirmed'] = this.confirmed;
    data['policyagreed'] = this.policyagreed;
    data['deleted'] = this.deleted;
    data['suspended'] = this.suspended;
    data['mnethostid'] = this.mnethostid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['idnumber'] = this.idnumber;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['emailstop'] = this.emailstop;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['institution'] = this.institution;
    data['department'] = this.department;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['lang'] = this.lang;
    data['calendartype'] = this.calendartype;
    data['theme'] = this.theme;
    data['timezone'] = this.timezone;
    data['firstaccess'] = this.firstaccess;
    data['lastaccess'] = this.lastaccess;
    data['lastlogin'] = this.lastlogin;
    data['currentlogin'] = this.currentlogin;
    data['lastip'] = this.lastip;
    data['secret'] = this.secret;
    data['picture'] = this.picture;
    data['description'] = this.description;
    data['descriptionformat'] = this.descriptionformat;
    data['mailformat'] = this.mailformat;
    data['maildigest'] = this.maildigest;
    data['maildisplay'] = this.maildisplay;
    data['autosubscribe'] = this.autosubscribe;
    data['trackforums'] = this.trackforums;
    data['timecreated'] = this.timecreated;
    data['timemodified'] = this.timemodified;
    data['trustbitmask'] = this.trustbitmask;
    data['imagealt'] = this.imagealt;
    data['lastnamephonetic'] = this.lastnamephonetic;
    data['firstnamephonetic'] = this.firstnamephonetic;
    data['middlename'] = this.middlename;
    data['alternatename'] = this.alternatename;
    data['moodlenetprofile'] = this.moodlenetprofile;
    data['src'] = this.src;
    return data;
  }
}
