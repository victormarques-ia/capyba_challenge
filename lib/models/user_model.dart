// ignore_for_file: unnecessary_getters_setters
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String _uid;
  String _name;
  String _email;
  String _password;
  String _avatarAddress;
  String _bio;
  bool _activated;
  Timestamp _createdAt;
  Timestamp _updatedAt;
  List<PublicationModel> _publications;

  UserModel(
      {String uid,
      String name,
      String email,
      String password,
      String avatarAddress,
      String bio,
      bool activated,
      Timestamp createdAt,
      Timestamp updatedAt,
      List<PublicationModel> publications}) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._password = password;
    this._avatarAddress = avatarAddress;
    this._bio = bio;
    this._activated = activated;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._publications = publications;
  }

  String get uid => _uid;
  set uid(String uid) => _uid = uid;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;
  String get avatarAddress => _avatarAddress;
  set avatarAddress(String avatarAddress) => _avatarAddress = avatarAddress;
  String get bio => _bio;
  set bio(String bio) => _bio = bio;
  bool get activated => _activated;
  set activated(bool activated) => _activated = activated;
  Timestamp get createdAt => _createdAt;
  set createdAt(Timestamp createdAt) => _createdAt = createdAt;
  Timestamp get updatedAt => _updatedAt;
  set updatedAt(Timestamp updatedAt) => _updatedAt = updatedAt;
  List<PublicationModel> get publications => _publications;
  set publications(List<PublicationModel> publications) =>
      _publications = publications;

  UserModel.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _avatarAddress = json['avatar_address'];
    _bio = json['bio'];
    _activated = json['activated'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  factory UserModel.fromDocument(DocumentSnapshot snapshot) {
    final doc = snapshot.data();

    return UserModel(
      uid: doc['uid'],
      name: doc['name'],
      email: doc['email'],
      avatarAddress: doc['avatar_address'],
      bio: doc['bio'],
      activated: doc['activated'],
      createdAt: doc['created_at'],
      updatedAt: doc['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['name'] = this._name;
    data['email'] = this._email;
    data['avatar_address'] = this._avatarAddress;
    data['bio'] = this._bio;
    data['activated'] = this._activated;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
