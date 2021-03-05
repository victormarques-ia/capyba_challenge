// ignore_for_file: unnecessary_getters_setters
class PublicationModel {
  String _uid;
  String _description;
  String _imageAddress;
  String _ownerUid;
  bool _public;

  PublicationModel(
      {String uid,
      String description,
      String imageAddress,
      String ownerUid,
      bool public}) {
    this._uid = uid;
    this._description = description;
    this._imageAddress = imageAddress;
    this._ownerUid = ownerUid;
    this._public = public;
  }

  String get uid => _uid;
  set uid(String uid) => _uid = uid;
  String get description => _description;
  set description(String description) => _description = description;
  String get imageAddress => _imageAddress;
  set imageAddress(String imageAddress) => _imageAddress = imageAddress;
  String get ownerUid => _ownerUid;
  set ownerUid(String ownerUid) => _ownerUid = ownerUid;
  bool get public => _public;
  set public(bool public) => _public = public;

  PublicationModel.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _description = json['description'];
    _imageAddress = json['image_address'];
    _ownerUid = json['owner_uid'];
    _public = json['public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['description'] = this._description;
    data['image_address'] = this._imageAddress;
    data['owner_uid'] = this._ownerUid;
    data['public'] = this._public;
    return data;
  }
}
