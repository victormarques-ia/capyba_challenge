// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicationModel {
  String _uid;
  String _description;
  String _imageAddress;
  String _ownerUid;
  bool _public;
  Timestamp _createdAt;
  Timestamp _updatedAt;

  PublicationModel(
      {String uid,
      String description,
      String imageAddress,
      String ownerUid,
      bool public,
      Timestamp createdAt,
      Timestamp updatedAt}) {
    this._uid = uid;
    this._description = description;
    this._imageAddress = imageAddress;
    this._ownerUid = ownerUid;
    this._public = public;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
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
  Timestamp get createdAt => _createdAt;
  set createdAt(Timestamp createdAt) => _createdAt = createdAt;
  Timestamp get updatedAt => _updatedAt;
  set updatedAt(Timestamp updatedAt) => _updatedAt = updatedAt;

  PublicationModel.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _description = json['description'];
    _imageAddress = json['image_address'];
    _ownerUid = json['owner_uid'];
    _public = json['public'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  factory PublicationModel.fromDocument(DocumentSnapshot snapshot) {
    final doc = snapshot.data();

    return PublicationModel(
      uid: snapshot.id,
      description: doc['description'],
      imageAddress: doc['image_address'],
      ownerUid: doc['owner_uid'],
      public: doc['public'],
      createdAt: doc['created_at'],
      updatedAt: doc['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['image_address'] = this._imageAddress;
    data['owner_uid'] = this._ownerUid;
    data['public'] = this._public;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
