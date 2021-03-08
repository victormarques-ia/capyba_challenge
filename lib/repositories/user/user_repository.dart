import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/services/image_service.dart';
import 'package:capyba_challenge/utils/upload_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final _collectionName = "users";
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final ImageService _imageService = new ImageService();

  Future registerUserData(UserModel userModel) async {
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

  Future updateUserData(
      UserModel userModel, String userUid, String oldUserImage) async {
    bool result = false;

    Future<QuerySnapshot> users = _firebaseFirestore
        .collection(_collectionName)
        .where("uid", isEqualTo: userUid)
        .get();

    String avatarUrl;
    if (oldUserImage == null) {
      await _imageService.deleteImage(oldUserImage);
      avatarUrl = await _imageService.uploadImage(
          userModel.avatarAddress, userModel.uid, UploadTypes.avatar);
    }
    userModel.updatedAt = Timestamp.now();

    users.then((query) => {
          query.docs.first.reference.update({
            "name": userModel.name,
            "avatar_address":
                avatarUrl != null ? avatarUrl : userModel.avatarAddress,
            "bio": userModel.bio,
            "updated_at": userModel.updatedAt
          }).then((value) => result = true)
        });

    return result;
  }

  Future deleteUser(String userUid) async {
    bool result = false;

    Future<QuerySnapshot> users = _firebaseFirestore
        .collection(_collectionName)
        .where("uid", isEqualTo: userUid)
        .limit(1)
        .get();

    users.then(
      (query) async {
        final user = query.docs[0].data();
        await _imageService.deleteImage(user["avatar_address"]);
        query.docs[0].reference.delete().then((value) => result = true);
      },
    );

    return result;
  }

  Future<UserModel> getUser(String userUid) async {
    UserModel user;
    await _firebaseFirestore
        .collection(_collectionName)
        .where("uid", isEqualTo: userUid)
        .get()
        .then(
          (query) => user = UserModel.fromDocument(
            query.docs[0],
          ),
        );

    return user;
  }
}
