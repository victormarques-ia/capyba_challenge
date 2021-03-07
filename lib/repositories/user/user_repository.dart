import 'package:capyba_challenge/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future updateUserData(UserModel userModel) async {
    bool result;

    CollectionReference users = _firebaseFirestore.collection("users");

    userModel.createdAt = Timestamp.now();
    userModel.updatedAt = Timestamp.now();

    await users
        .add(
          userModel.toJson(),
        )
        .then((value) => result = true);
    return result;
  }
}
