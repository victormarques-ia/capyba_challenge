import 'package:capyba_challenge/components/custtom_bottom_dialog.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/repositories/user/user_repository.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:capyba_challenge/utils/custom_show_bottom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class UserFormController with ChangeNotifier {
  final _user = new UserModel();
  final loginForm = GlobalKey<FormState>();
  final registerForm = GlobalKey<FormState>();
  bool _validate = false;

  final AuthService _authService = new AuthService();
  final UserRepository _userRepository = new UserRepository();

  UserModel get user => _user;
  bool get validate => _validate;

  set validate(bool value) {
    _validate = value;
    notifyListeners();
  }

  onSavedAvatar(String value) {
    _user.avatarAddress = value;
    notifyListeners();
  }

  onSavedName(String value) {
    _user.name = value;
    notifyListeners();
  }

  onSavedEmail(String value) {
    _user.email = value;
    notifyListeners();
  }

  onSavedPassword(String value) {
    _user.password = value;
    notifyListeners();
  }

  onSavedBio(String value) {
    _user.bio = value;
    notifyListeners();
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if (value.length == 0) {
      return 'Por favor, preencha o campo com o E-mail.';
    } else if (!regExp.hasMatch(value)) {
      return 'E-mail inválido!';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return 'Por favor, preencha o campo com a senha';
    } else if (value.length < 6) {
      return 'A senha deve conter mais que 6 caracters.';
    } else {
      return null;
    }
  }

  String validateName(String value) {
    if (value.length == 0) {
      return 'Por favor, preencha o campo com o seu nome';
    } else {
      return null;
    }
  }

  Future<void> showCustomDialogLogin(BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage: "Login ou senha inválidos.",
        backgroundColor: kErrorColor,
        iconMessage: FeatherIcons.alertTriangle,
        labelDialog: "Login",
      ),
      "Login",
    );
  }

  Future<void> showCustomDialogRegister(BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage:
            "Houve um erro ao tentar fazer o cadastro, tente novamente.",
        backgroundColor: kErrorColor,
        iconMessage: FeatherIcons.alertTriangle,
        labelDialog: "Register",
      ),
      "Register",
    );
  }

  Future<void> showCustomDialogImage(BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage: "É necessário adicionar uma imagem.",
        backgroundColor: kErrorColor,
        iconMessage: FeatherIcons.alertTriangle,
        labelDialog: "AvatarImage",
      ),
      "AvatarImage",
    );
  }

  login() async {
    try {
      Future loginResult = await _authService.signInWithEmailAndPassword(_user);

      _validate = loginResult != null;
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  register() async {
    try {
      UserModel user = await _authService.registerUser(_user);

      _validate = user != null;

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
