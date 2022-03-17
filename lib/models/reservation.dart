class AppReservation {
  int? _id;
  int? _firm;
  String? _tumZamanlar;
  String? _tarih;
  String? _basSaat;
  String? _bitSaat;
  String? _aciklama;
  int? _cinsiyet;
  String? _yasAraligi;
  int? _kisiSayisi;
  int? _misafirSayisi;
  int? _bildirimSuresi;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _profilePhotoUrl;

  AppReservation(
      {int? id,
        int? firm,
        String? tumZamanlar,
        String? tarih,
        String? basSaat,
        String? bitSaat,
        String? aciklama,
        int? cinsiyet,
        String? yasAraligi,
        int? kisiSayisi,
        int? misafirSayisi,
        int? bildirimSuresi,
        int? status,
        String? createdAt,
        String? updatedAt,
        String? profilePhotoUrl}) {
    if (id != null) {
      _id = id;
    }
    if (firm != null) {
      _firm = firm;
    }
    if (tumZamanlar != null) {
      _tumZamanlar = tumZamanlar;
    }
    if (tarih != null) {
      _tarih = tarih;
    }
    if (basSaat != null) {
      _basSaat = basSaat;
    }
    if (bitSaat != null) {
      _bitSaat = bitSaat;
    }
    if (aciklama != null) {
      _aciklama = aciklama;
    }
    if (cinsiyet != null) {
      _cinsiyet = cinsiyet;
    }
    if (yasAraligi != null) {
      _yasAraligi = yasAraligi;
    }
    if (kisiSayisi != null) {
      _kisiSayisi = kisiSayisi;
    }
    if (misafirSayisi != null) {
      _misafirSayisi = misafirSayisi;
    }
    if (bildirimSuresi != null) {
      _bildirimSuresi = bildirimSuresi;
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
  int? get firm => _firm;
  set firm(int? firm) => _firm = firm;
  String? get tumZamanlar => _tumZamanlar;
  set tumZamanlar(String? tumZamanlar) => _tumZamanlar = tumZamanlar;
  String? get tarih => _tarih;
  set tarih(String? tarih) => _tarih = tarih;
  String? get basSaat => _basSaat;
  set basSaat(String? basSaat) => _basSaat = basSaat;
  String? get bitSaat => _bitSaat;
  set bitSaat(String? bitSaat) => _bitSaat = bitSaat;
  String? get aciklama => _aciklama;
  set aciklama(String? aciklama) => _aciklama = aciklama;
  int? get cinsiyet => _cinsiyet;
  set cinsiyet(int? cinsiyet) => _cinsiyet = cinsiyet;
  String? get yasAraligi => _yasAraligi;
  set yasAraligi(String? yasAraligi) => _yasAraligi = yasAraligi;
  int? get kisiSayisi => _kisiSayisi;
  set kisiSayisi(int? kisiSayisi) => _kisiSayisi = kisiSayisi;
  int? get misafirSayisi => _misafirSayisi;
  set misafirSayisi(int? misafirSayisi) => _misafirSayisi = misafirSayisi;
  int? get bildirimSuresi => _bildirimSuresi;
  set bildirimSuresi(int? bildirimSuresi) => _bildirimSuresi = bildirimSuresi;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get profilePhotoUrl => _profilePhotoUrl;
  set profilePhotoUrl(String? profilePhotoUrl) =>
      _profilePhotoUrl = profilePhotoUrl;

  AppReservation.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firm = json['firm'];
    _tumZamanlar = json['tum_zamanlar'];
    _tarih = json['tarih'];
    _basSaat = json['bas_saat'];
    _bitSaat = json['bit_saat'];
    _aciklama = json['aciklama'];
    _cinsiyet = json['cinsiyet'];
    _yasAraligi = json['yas_araligi'];
    _kisiSayisi = json['kisi_sayisi'];
    _misafirSayisi = json['misafir_sayisi'];
    _bildirimSuresi = json['bildirim_suresi'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['firm'] = _firm;
    data['tum_zamanlar'] = _tumZamanlar;
    data['tarih'] = _tarih;
    data['bas_saat'] = _basSaat;
    data['bit_saat'] = _bitSaat;
    data['aciklama'] = _aciklama;
    data['cinsiyet'] = _cinsiyet;
    data['yas_araligi'] = _yasAraligi;
    data['kisi_sayisi'] = _kisiSayisi;
    data['misafir_sayisi'] = _misafirSayisi;
    data['bildirim_suresi'] = _bildirimSuresi;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['profile_photo_url'] = _profilePhotoUrl;
    return data;
  }
}
