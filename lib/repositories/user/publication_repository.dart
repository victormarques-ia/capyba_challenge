import 'package:capyba_challenge/models/publication_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicationRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future createPublication(PublicationModel publicationModel) async {
    bool result;
    CollectionReference publications =
        _firebaseFirestore.collection("publications");

    publicationModel.createdAt = Timestamp.now();
    publicationModel.updatedAt = Timestamp.now();

    await publications
        .add(
          publicationModel.toJson(),
        )
        .then((value) => result = true);
    return result;
  }

  Stream<List<PublicationModel>> getAllPublications() {
    return _firebaseFirestore
        .collection("publications")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return PublicationModel.fromDocument(doc);
      }).toList();
    });
  }

  Stream<List<PublicationModel>> getOnylPublicPublications() {
    return _firebaseFirestore
        .collection("publications")
        .where("public", isEqualTo: true)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return PublicationModel.fromDocument(doc);
      }).toList();
    });
  }

  Future<PublicationModel> getSpecificPublication(String publicationUid) async {
    DocumentSnapshot doc;
    await _firebaseFirestore
        .collection("publications")
        .doc(publicationUid)
        .get()
        .then((query) {
      doc = query;
    });

    return PublicationModel.fromDocument(doc);
  }

  Future<bool> deleteSpecificPublication(String publicationUid) async {
    bool result;

    await _firebaseFirestore
        .collection("publications")
        .doc(publicationUid)
        .delete()
        .then((value) => result = true)
        .catchError(
      (error) {
        result = false;
        print("Failed to delete publication: $error");
      },
    );

    return result;
  }
}
