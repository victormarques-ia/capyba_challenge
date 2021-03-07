import 'package:capyba_challenge/models/publication_model.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/repositories/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicationRepository {
  final _collectionName = "publications";
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final UserRepository _userRepository = new UserRepository();

  Future createPublication(PublicationModel publicationModel) async {
    bool result;
    CollectionReference publications =
        _firebaseFirestore.collection(_collectionName);

    publicationModel.createdAt = Timestamp.now();
    publicationModel.updatedAt = Timestamp.now();

    await publications
        .add(
          publicationModel.toJson(),
        )
        .then((value) => result = true);
    return result;
  }

  Stream<List<Future<PublicationModel>>> getAllPublications() async* {
    yield* _firebaseFirestore
        .collection(_collectionName)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) async {
        PublicationModel publication = PublicationModel.fromDocument(doc);
        UserModel user = await _userRepository.getUser(publication.ownerUid);
        publication.user = user;

        return publication;
      }).toList();
    });
  }

  Future<List<PublicationModel>> getUserSpecificPublications(
      String ownerUid) async {
    QuerySnapshot query = await _firebaseFirestore
        .collection(_collectionName)
        .where("owner_uid", isEqualTo: ownerUid)
        .orderBy("created_at", descending: true)
        .get();
    List<PublicationModel> publications = [];

    query.docs.forEach((doc) {
      PublicationModel publication = PublicationModel.fromDocument(doc);
      publications.add(publication);
    });

    UserModel user = await _userRepository.getUser(publications[0].ownerUid);
    publications[0].user = user;

    return publications;
  }

  Stream<List<Future<PublicationModel>>> getOnylPublicPublications() async* {
    yield* _firebaseFirestore
        .collection(_collectionName)
        .where("public", isEqualTo: true)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) async {
        PublicationModel publication = PublicationModel.fromDocument(doc);
        UserModel user = await _userRepository.getUser(publication.ownerUid);
        publication.user = user;

        return publication;
      }).toList();
    });
  }

  Future<PublicationModel> getSpecificPublication(String publicationUid) async {
    DocumentSnapshot doc;
    await _firebaseFirestore
        .collection(_collectionName)
        .doc(publicationUid)
        .get()
        .then((query) {
      doc = query;
    });

    PublicationModel publication = PublicationModel.fromDocument(doc);
    UserModel user = await _userRepository.getUser(publication.ownerUid);
    publication.user = user;

    return publication;
  }

  Future<bool> deleteSpecificPublication(String publicationUid) async {
    bool result;

    await _firebaseFirestore
        .collection(_collectionName)
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
