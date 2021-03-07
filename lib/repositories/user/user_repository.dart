import 'package:capyba_challenge/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final _collectionName = "users";
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future updateUserData(UserModel userModel) async {
    bool result;

    CollectionReference users = _firebaseFirestore.collection(_collectionName);

    userModel.createdAt = Timestamp.now();
    userModel.updatedAt = Timestamp.now();

    await users
        .add(
          userModel.toJson(),
        )
        .then((value) => result = true);
    return result;
  }

  Future<UserModel> getUser(String userUid) async {
    DocumentSnapshot doc;
    await _firebaseFirestore
        .collection(_collectionName)
        .where("uid", isEqualTo: userUid)
        .get()
        .then((query) => doc = query.docs[0]);

    return UserModel.fromDocument(doc);
  }
}
