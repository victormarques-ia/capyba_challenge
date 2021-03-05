import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final String _avatarFolder = "avatar/";

  Future uploadAvatarImage(String imagePath, String userUid) async {
    String avatarImageUrl;
    File fileImage = File(imagePath);
    try {
      Reference ref =
          _firebaseStorage.ref().child("${_avatarFolder}avatar_$userUid");

      UploadTask uploadTask = ref.putFile(fileImage);

      await uploadTask.then((snapshot) async =>
          avatarImageUrl = await snapshot.ref.getDownloadURL());

      return avatarImageUrl;
    } catch (e) {
      print(e.toString());
    }
    return avatarImageUrl;
  }
}
