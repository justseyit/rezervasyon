class AppFilter {
  int? _id;
  String? _name;
  int? _cat;
  int? _isTanimi;
  int? _row;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _profilePhotoUrl;

  AppFilter(
      {int? id,
        String? name,
        int? cat,
        int? isTanimi,
        int? row,
        int? status,
        String? createdAt,
        String? updatedAt,
        String? profilePhotoUrl}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (cat != null) {
      _cat = cat;
    }
    if (isTanimi != null) {
      _isTanimi = isTanimi;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get cat => _cat;
  set cat(int? cat) => _cat = cat;
  int? get isTanimi => _isTanimi;
  set isTanimi(int? isTanimi) => _isTanimi = isTanimi;
  int? get row => _row;
  set row(int? row) => _row = row;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get profilePhotoUrl => _profilePhotoUrl;
  set profilePhotoUrl(String? profilePhotoUrl) => _profilePhotoUrl = profilePhotoUrl;

  AppFilter.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _cat = json['cat'];
    _isTanimi = json['is_tanimi'];
    _row = json['row'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['cat'] = _cat;
    data['is_tanimi'] = _isTanimi;
    data['row'] = _row;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['profile_photo_url'] = _profilePhotoUrl;
    return data;
  }
}
