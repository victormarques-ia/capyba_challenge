import 'dart:collection';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/repositories/user/user_repository.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserFormController with ChangeNotifier {
  final _user = new UserModel();
  final _validationItem = new HashMap();

  final AuthService _authService = new AuthService();
  final UserRepository _userRepository = new UserRepository();

  UserModel get user => _user;
  HashMap get validationItem => _validationItem;

  changeAvatar(String value) {
    _user.avatarAddress = value;
    notifyListeners();
  }

  changeName(String value) {
    _user.name = value;
    notifyListeners();
  }

  changeEmail(String value) {
    _user.email = value;
    notifyListeners();
  }

  changePassword(String value) {
    _user.password = value;
    notifyListeners();
  }

  changeBio(String value) {
    _user.bio = value;
    notifyListeners();
  }

  login() async {
    try {
      await _authService.signInWithEmailAndPassword(_user);
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  register() async {
    try {
      UserModel user = await _authService.registerUser(_user);

      UserModel updatedUser = new UserModel(
        uid: user.uid,
        name: _user.name,
        email: _user.email,
        avatarAddress: _user.avatarAddress,
        bio: _user.bio,
        activated: user.activated,
      );

      user = await _userRepository.updateUserData(updatedUser);
    } catch (e) {
      print(e.toString());
    }
  }
}
