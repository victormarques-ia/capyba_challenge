import 'package:capyba_challenge/models/user.dart';
import 'package:flutter/widgets.dart';

class UserFormController {
  final user = ValueNotifier<User>(new User());

  changeName(String value) => user.value.name = value;

  changeEmail(String value) => user.value.email = value;

  changePassword(String value) => user.value.password = value;

  changeBio(String value) => user.value.bio = value;

  login() {
    print({user.value.email, user.value.password});
  }

  register() {
    print(
      {
        user.value.name,
        user.value.email,
        user.value.password,
        user.value.bio,
      },
    );
  }
}
