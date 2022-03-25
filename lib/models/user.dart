class AppUser {
  int? _id;
  String? _name;
  String? _adSoyad;
  String? _dogumTarihi;
  int? _cinsiyet;
  String? _isTanimi;
  String? _email;
  String? _username;
  String? _phone;
  String? _address;
  String? _county;
  String? _town;
  String? _website;
  String? _instagramLink;
  String? _facebookLink;
  String? _twitterLink;
  String? _cat;
  String? _bio;
  String? _emailVerifiedAt;
  String? _type;
  int? _currentTeamId;
  String? _profilePhotoPath;
  String? _createdAt;
  String? _updatedAt;
  String? _profilePhotoUrl;
  String? _fav_ids;
  String? _rez_ids;
  String? _add_ids;

  AppUser({int? id, String? name, String? adSoyad, String? dogumTarihi, int? cinsiyet, String? isTanimi, String? email, String? username, String? phone, String? address, String? county, String? town, String? website, String? instagramLink, String? facebookLink, String? twitterLink, String? cat, String? bio, String? emailVerifiedAt, String? type, int? currentTeamId, String? profilePhotoPath, String? createdAt, String? updatedAt, String? profilePhotoUrl, String? favIDs, String? rezIDs, String? addIDs}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (adSoyad != null) {
      _adSoyad = adSoyad;
    }
    if (dogumTarihi != null) {
      _dogumTarihi = dogumTarihi;
    }
    if (cinsiyet != null) {
      _cinsiyet = cinsiyet;
    }
    if (isTanimi != null) {
      _isTanimi = isTanimi;
    }
    if (email != null) {
      _email = email;
    }
    if (username != null) {
      _username = username;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (address != null) {
      _address = address;
    }
    if (county != null) {
      _county = county;
    }
    if (town != null) {
      _town = town;
    }
    if (website != null) {
      _website = website;
    }
    if (instagramLink != null) {
      _instagramLink = instagramLink;
    }
    if (facebookLink != null) {
      _facebookLink = facebookLink;
    }
    if (twitterLink != null) {
      _twitterLink = twitterLink;
    }
    if (cat != null) {
      _cat = cat;
    }
    if (bio != null) {
      _bio = bio;
    }
    if (emailVerifiedAt != null) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (type != null) {
      _type = type;
    }
    if (currentTeamId != null) {
      _currentTeamId = currentTeamId;
    }
    if (profilePhotoPath != null) {
      _profilePhotoPath = profilePhotoPath;
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
    if (favIDs != null) {
      _fav_ids = favIDs;
    }
    if (rezIDs != null) {
      _rez_ids = rezIDs;
    }
    if (addIDs != null) {
      _add_ids = addIDs;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get adSoyad => _adSoyad;
  set adSoyad(String? adSoyad) => _adSoyad = adSoyad;
  String? get dogumTarihi => _dogumTarihi;
  set dogumTarihi(String? dogumTarihi) => _dogumTarihi = dogumTarihi;
  int? get cinsiyet => _cinsiyet;
  set cinsiyet(int? cinsiyet) => _cinsiyet = cinsiyet;
  String? get isTanimi => _isTanimi;
  set isTanimi(String? isTanimi) => _isTanimi = isTanimi;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get county => _county;
  set county(String? county) => _county = county;
  String? get town => _town;
  set town(String? town) => _town = town;
  String? get website => _website;
  set website(String? website) => _website = website;
  String? get instagramLink => _instagramLink;
  set instagramLink(String? instagramLink) => _instagramLink = instagramLink;
  String? get facebookLink => _facebookLink;
  set facebookLink(String? facebookLink) => _facebookLink = facebookLink;
  String? get twitterLink => _twitterLink;
  set twitterLink(String? twitterLink) => _twitterLink = twitterLink;
  String? get cat => _cat;
  set cat(String? cat) => _cat = cat;
  String? get bio => _bio;
  set bio(String? bio) => _bio = bio;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) => _emailVerifiedAt = emailVerifiedAt;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get currentTeamId => _currentTeamId;
  set currentTeamId(int? currentTeamId) => _currentTeamId = currentTeamId;
  String? get profilePhotoPath => _profilePhotoPath;
  set profilePhotoPath(String? profilePhotoPath) => _profilePhotoPath = profilePhotoPath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get profilePhotoUrl => _profilePhotoUrl;
  set profilePhotoUrl(String? profilePhotoUrl) => _profilePhotoUrl = profilePhotoUrl;
  List<int>? get favIDs {
    List<int>? temp = [];
    for (int i = 1; i <= _fav_ids!.length; i++) {
      if (i % 2 != 0) {
        try {
          temp.add(int.parse(_fav_ids![i]));
        } catch (e) {
          print(e);
        } finally {
          continue;
        }
      }
    }
    return temp;
  }

  set favIDs(List<int>? favIDs) {
    String temp = "[";
    for (int i = 0; i < favIDs!.length; i++) {
      temp += favIDs[i].toString();
      if (i != favIDs.length - 1) {
        temp += ",";
      }
    }
    temp += "]";
    _fav_ids = temp;
  }

  List<int>? get rezIDs {
    List<int>? temp = [];
    for (int i = 1; i <= _rez_ids!.length; i++) {
      if (i % 2 != 0) {
        try {
          temp.add(int.parse(_rez_ids![i]));
        } catch (e) {
          print(e);
        } finally {
          continue;
        }
      }
    }
    return temp;
  }

  set rezIDs(List<int>? rezIDs) {
    String temp = "[";
    for (int i = 0; i < rezIDs!.length; i++) {
      temp += rezIDs[i].toString();
      if (i != rezIDs.length - 1) {
        temp += ",";
      }
    }
    temp += "]";
    _rez_ids = temp;
  }

  List<int>? get addIDs {
    List<int>? temp = [];
    for (int i = 1; i <= _add_ids!.length; i++) {
      if (i % 2 != 0) {
        try {
          temp.add(int.parse(_add_ids![i]));
        } catch (e) {
          print(e);
        } finally {
          continue;
        }
      }
    }
    return temp;
  }

  set addIDs(List<int>? addIDs) {
    String temp = "[";
    for (int i = 0; i < addIDs!.length; i++) {
      temp += addIDs[i].toString();
      if (i != addIDs.length - 1) {
        temp += ",";
      }
    }
    temp += "]";
    _add_ids = temp;
  }

  AppUser.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _adSoyad = json['ad_soyad'];
    _dogumTarihi = json['dogum_tarihi'];
    _cinsiyet = json['cinsiyet'];
    _isTanimi = json['is_tanimi'];
    _email = json['email'];
    _username = json['username'];
    _phone = json['phone'];
    _address = json['address'];
    _county = json['county'];
    _town = json['town'];
    _website = json['website'];
    _instagramLink = json['instagram_link'];
    _facebookLink = json['facebook_link'];
    _twitterLink = json['twitter_link'];
    _cat = json['cat'];
    _bio = json['bio'];
    _emailVerifiedAt = json['email_verified_at'];
    _type = json['type'];
    _currentTeamId = json['current_team_id'];
    _profilePhotoPath = json['profile_photo_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profilePhotoUrl = json['profile_photo_url'];
    _fav_ids = json['fav_ids'];
    _rez_ids = json['rez_ids'];
    _add_ids = json['add_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['ad_soyad'] = _adSoyad;
    data['dogum_tarihi'] = _dogumTarihi;
    data['cinsiyet'] = _cinsiyet;
    data['is_tanimi'] = _isTanimi;
    data['email'] = _email;
    data['username'] = _username;
    data['phone'] = _phone;
    data['address'] = _address;
    data['county'] = _county;
    data['town'] = _town;
    data['website'] = _website;
    data['instagram_link'] = _instagramLink;
    data['facebook_link'] = _facebookLink;
    data['twitter_link'] = _twitterLink;
    data['cat'] = _cat;
    data['bio'] = _bio;
    data['email_verified_at'] = _emailVerifiedAt;
    data['type'] = _type;
    data['current_team_id'] = _currentTeamId;
    data['profile_photo_path'] = _profilePhotoPath;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['profile_photo_url'] = _profilePhotoUrl;
    data['fav_ids'] = _fav_ids;
    data['rez_ids'] = _rez_ids;
    data['add_ids'] = _add_ids;
    return data;
  }
}
