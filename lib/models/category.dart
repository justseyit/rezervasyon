class AppCategory {
  int? _id;
  String? _catName;
  String? _slug;
  String? _description;
  int? _row;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _profilePhotoUrl;

  AppCategory(
      { int? id,
        String? catName,
        String? slug,
        String? description,
        int? row,
        int? status,
        String? createdAt,
        String? updatedAt,
        String? profilePhotoUrl}) {
    if (id != null) {
      _id = id;
    }
    if (catName != null) {
      _catName = catName;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (description != null) {
      _description = description;
    }
    if (row != null) {
      _row = row;
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
  String? get catName => _catName;
  set catName(String? catName) => _catName = catName;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get row => _row;
  set row(int? row) => _row = row;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get profilePhotoUrl => _profilePhotoUrl;
  set profilePhotoUrl(String? profilePhotoUrl) =>
      _profilePhotoUrl = profilePhotoUrl;

  AppCategory.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _catName = json['cat_name'];
    _slug = json['slug'];
    _description = json['description'];
    _row = json['row'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['cat_name'] = _catName;
    data['slug'] = _slug;
    data['description'] = _description;
    data['row'] = _row;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['profile_photo_url'] = _profilePhotoUrl;
    return data;
  }
}
