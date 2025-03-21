class ModelUser {
  int? id = 0;
  String? name = '';
  String? username = '';
  String? email = '';
  Address? address;
  String? phone = '';
  String? website = '';
  Company? company;

  ModelUser({
    this.id = 0,
    this.name = '',
    this.username = '',
    this.email = '',
    this.address,
    this.phone = '',
    this.website = '',
    this.company,
  });

  ModelUser.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"].toString();
    username = json["username"].toString();
    email = json["email"].toString();
    address = json["address"] == null ? null : Address.fromJson(json["address"]);
    phone = json["phone"].toString();
    website = json["website"].toString();
    company = json["company"] == null ? null : Company.fromJson(json["company"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["username"] = username;
    data["email"] = email;
    if (address != null) {
      data["address"] = address?.toJson();
    }
    data["phone"] = phone;
    data["website"] = website;
    if (company != null) {
      data["company"] = company?.toJson();
    }
    return data;
  }
}

class Company {
  String? name = '';
  String? catchPhrase = '';
  String? bs = '';

  Company({
    this.name = '',
    this.catchPhrase = '',
    this.bs = '',
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json["name"].toString();
    catchPhrase = json["catchPhrase"].toString();
    bs = json["bs"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["catchPhrase"] = catchPhrase;
    data["bs"] = bs;
    return data;
  }
}

class Address {
  String? street = '';
  String? suite = '';
  String? city = '';
  String? zipcode = '';
  Geo? geo;

  Address({
    this.street = '',
    this.suite = '',
    this.city = '',
    this.zipcode = '',
    this.geo,
  });

  Address.fromJson(Map<String, dynamic> json) {
    street = json["street"].toString();
    suite = json["suite"].toString();
    city = json["city"].toString();
    zipcode = json["zipcode"].toString();
    geo = json["geo"] == null ? null : Geo.fromJson(json["geo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["street"] = street;
    data["suite"] = suite;
    data["city"] = city;
    data["zipcode"] = zipcode;
    if (geo != null) {
      data["geo"] = geo?.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat = '';
  String? lng = '';

  Geo({this.lat = '', this.lng = ''});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json["lat"].toString();
    lng = json["lng"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lng"] = lng;
    return data;
  }
}
