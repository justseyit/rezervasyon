class AppProperty {
  int? _id;
  String? _title;
  String? _description;
  String? _slug;
  String? _images;
  String? _il;
  String? _ilce;
  String? _address;
  String? _map;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _profilePhotoUrl;

  AppProperty(
      {int? id,
        String? title,
        String? description,
        String? slug,
        String? images,
        String? il,
        String? ilce,
        String? address,
        String? map,
        int? status,
        String? createdAt,
        String? updatedAt,
        String? profilePhotoUrl}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (images != null) {
      _images = images;
    }
    if (il != null) {
      _il = il;
    }
    if (ilce != null) {
      _ilce = ilce;
    }
    if (address != null) {
      _address = address;
    }
    if (map != null) {
      _map = map;
    }
    if (status != null) {
      _status = status;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (profilePhotoUrl != null) {
      _profilePhotoUrl = profilePhotoUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get images => _images;
  set images(String? images) => _images = images;
  String? get il => _il;
  set il(String? il) => _il = il;
  String? get ilce => _ilce;
  set ilce(String? ilce) => _ilce = ilce;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get map => _map;
  set map(String? map) => _map = map;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get profilePhotoUrl => _profilePhotoUrl;
  set profilePhotoUrl(String? profilePhotoUrl) =>
      _profilePhotoUrl = profilePhotoUrl;

  AppProperty.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _slug = json['slug'];
    _images = json['images'];
    _il = json['il'];
    _ilce = json['ilce'];
    _address = json['address'];
    _map = json['map'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['description'] = _description;
    data['slug'] = _slug;
    data['images'] = _images;
    data['il'] = _il;
    data['ilce'] = _ilce;
    data['address'] = _address;
    data['map'] = _map;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['profile_photo_url'] = _profilePhotoUrl;
    return data;
  }
}
