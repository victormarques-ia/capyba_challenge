import 'package:capyba_challenge/models/publication_model.dart';
import 'package:flutter/material.dart';

class NewPublicationController with ChangeNotifier {
  final _publication = new PublicationModel();

  onSavedImage(String value) {
    _publication.imageAddress = value;
    notifyListeners();
  }
}
