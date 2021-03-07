import 'package:firebase_auth/firebase_auth.dart';
import 'package:capyba_challenge/models/user_model.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
