import 'package:capyba_challenge/models/user_model.dart';

abstract class IUserRepository {
  Future updateUserData(UserModel userModel);
}
