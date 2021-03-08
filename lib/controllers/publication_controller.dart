import 'package:capyba_challenge/components/custom_bottom_dialog.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/repositories/user/publication_repository.dart';
import 'package:capyba_challenge/repositories/user/user_repository.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:capyba_challenge/services/image_service.dart';
import 'package:capyba_challenge/utils/custom_show_bottom_dialog.dart';
import 'package:capyba_challenge/utils/upload_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PublicationController with ChangeNotifier {
  final _publication = new PublicationModel();
  bool createdPublication = false;
  bool deletedPublication = false;

  final PublicationRepository _publicationRepository =
      new PublicationRepository();
  final UserRepository _userRepository = new UserRepository();
  final ImageService _imageService = new ImageService();
  final AuthService _authService = new AuthService();

  PublicationModel get publication => _publication;

  Stream<List<Future<PublicationModel>>> get allPublications {
    return getAllPublications();
  }

  Stream<List<Future<PublicationModel>>> get onlyPublicPublications {
    return getOnlyPublicPublications();
  }

  onSavedDescription(String value) {
    _publication.description = value;
    notifyListeners();
  }

  onSavedPublicOption(bool value) {
    _publication.public = value;
    notifyListeners();
  }

  onSavedImage(String value) {
    _publication.imageAddress = value;
    notifyListeners();
  }

  onCreatedPublication() {
    createdPublication = !createdPublication;
    notifyListeners();
  }

  onDeletedPublication() {
    deletedPublication = !deletedPublication;
    notifyListeners();
  }

  Future<void> showCustomDialogPublicationSuccess(BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage: "Sucesso ao criar publicação!",
        backgroundColor: kMainColor,
        iconMessage: FeatherIcons.check,
        labelDialog: "Publication",
      ),
      "Publication",
    );
  }

  Future<void> showCustomDialogPublicationError(BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage:
            "Houve um erro ao tentar criar a publicação, tente novamente.",
        backgroundColor: kErrorColor,
        iconMessage: FeatherIcons.alertTriangle,
        labelDialog: "Publication",
      ),
      "Publication",
    );
  }

  Future<void> showCustomDialogPublicationDeleteSuccess(
      BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage: "Sucesso ao deletar publicação!",
        backgroundColor: kMainColor,
        iconMessage: FeatherIcons.check,
        labelDialog: "SpecificPublication",
      ),
      "SpecificPublication",
    );
  }

  Future<void> showCustomDialogPublicationDeleteError(
      BuildContext context) async {
    return customShowBottomDialog(
      context,
      CustomBottomDialog(
        textMessage: "Houve um erro ao deletar publicação, tente novamente.",
        backgroundColor: kErrorColor,
        iconMessage: FeatherIcons.alertTriangle,
        labelDialog: "SpecificPublication",
      ),
      "SpecificPublication",
    );
  }

  createPublication() async {
    try {
      UserModel currentUser = await _authService.getCurrentUser();
      _publication.ownerUid = currentUser.uid;
      String imageUrl = await _imageService.uploadImage(
        _publication.imageAddress,
        currentUser.uid,
        UploadTypes.publication,
      );

      _publication.imageAddress = imageUrl;
      bool result =
          await _publicationRepository.createPublication(_publication);

      return result;
    } catch (e) {
      print(e.toString());
    }
  }

  getAllPublications() {
    try {
      return _publicationRepository.getAllPublications();
    } catch (e) {
      print(e.toString());
    }
  }

  getOnlyPublicPublications() {
    try {
      return _publicationRepository.getOnylPublicPublications();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<PublicationModel>> getUserSpecificPublications(
      String ownerUid) async {
    try {
      return await _publicationRepository.getUserSpecificPublications(ownerUid);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<UserModel> getSelectedUser(String ownerUid) async {
    try {
      return await _userRepository.getUser(ownerUid);
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  Future<PublicationModel> getSpecificPublication(String publicationUid) async {
    try {
      return await _publicationRepository
          .getSpecificPublication(publicationUid);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  deleteSpecificPublication(
      String publicationUid, String publicationImageUrl) async {
    try {
      final publicationDeleted = await _publicationRepository
          .deleteSpecificPublication(publicationUid);
      if (publicationDeleted) {
        final imageDeleted = _imageService.deleteImage(publicationImageUrl);
        return imageDeleted;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
