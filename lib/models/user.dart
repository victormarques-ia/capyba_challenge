class User {
  String _id;
  String _name;
  String _email;
  String _password;
  String _avatarAddress;
  String _bio;
  bool _activated;

  User(
      {String id,
      String name,
      String email,
      String password,
      String avatarAddress,
      String bio,
      bool activated}) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._password = password;
    this._avatarAddress = avatarAddress;
    this._bio = bio;
    this._activated = activated;
  }

  String get id => _id;
  set id(String id) => _id = id;
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

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _avatarAddress = json['avatar_address'];
    _bio = json['bio'];
    _activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['password'] = this._password;
    data['avatar_address'] = this._avatarAddress;
    data['bio'] = this._bio;
    data['activated'] = this._activated;
    return data;
  }
}
