import 'package:capyba_challenge/models/publication_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicationRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future createPublication(PublicationModel publicationModel) async {
    bool result;
    CollectionReference publications =
        _firebaseFirestore.collection("publications");

    await publications
        .add(
          publicationModel.toJson(),
        )
        .then((value) => result = true);
    return result;
  }
}
