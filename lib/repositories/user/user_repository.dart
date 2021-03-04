import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/repositories/user/user_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository implements IUserRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future updateUserData(UserModel userModel) async {
    CollectionReference users = _firebaseFirestore.collection("users");

    users.add(
      userModel.toJson(),
    );
    return users;
  }
}
