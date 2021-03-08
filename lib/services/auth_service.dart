import 'package:firebase_auth/firebase_auth.dart';
import 'package:capyba_challenge/models/user_model.dart';

import '../models/user_model.dart';
import '../repositories/user/user_repository.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = new UserRepository();

  UserModel _userFromFirebaseUser(User user) {
    return user != null
        ? (UserModel(
            uid: user.uid,
            activated: user.emailVerified,
          ))
        : null;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<UserModel> getCurrentUser() async {
    return _userFromFirebaseUser(_auth.currentUser);
  }

  Future<UserModel> getUserData() async {
    User firebaseUser = _auth.currentUser;
    return await _userRepository.getUser(firebaseUser.uid);
  }

  Future<UserModel> registerUser(UserModel userModel) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      User user = authResult.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<UserModel> signInWithEmailAndPassword(UserModel userModel) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      User user = authResult.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future deleteCurrentUser() async {
    try {
      User user = _auth.currentUser;

      await user.delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
