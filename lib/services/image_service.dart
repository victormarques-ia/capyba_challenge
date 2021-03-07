import 'dart:io';
import 'package:capyba_challenge/utils/upload_types.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final String _avatarFolder = "avatars/";
  final String _publicationFolder = "publications/";

  Future uploadImage(
      String imagePath, String userUid, UploadTypes uploadType) async {
    String avatarImageUrl;
    File fileImage = File(imagePath);
    try {
      Reference ref;

      if (uploadType == UploadTypes.avatar) {
        ref = _firebaseStorage.ref().child("${_avatarFolder}avatar_$userUid");
      } else if (uploadType == UploadTypes.publication) {
        ref = _firebaseStorage.ref().child(
            "${_publicationFolder}publication_${DateTime.now().microsecondsSinceEpoch}");
      }

      UploadTask uploadTask = ref.putFile(fileImage);

      await uploadTask.then((snapshot) async =>
          avatarImageUrl = await snapshot.ref.getDownloadURL());

      return avatarImageUrl;
    } catch (e) {
      print(e.toString());
    }
    return avatarImageUrl;
  }

  deleteImage(String imageUrl) {
    try {
      Reference storageReference = _firebaseStorage.refFromURL(imageUrl);

      storageReference.delete();

      return true;
    } catch (e) {
      print(e.toString());
    }

    return false;
  }
}
