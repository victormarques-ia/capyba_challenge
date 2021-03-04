import 'dart:io';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/components/custom_app_bar.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatelessWidget {
  final Function changeImage;

  const CameraScreen({Key key, this.changeImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ImageCapture(changeImage: changeImage),
    );
  }
}

class ImageCapture extends StatefulWidget {
  final Function changeImage;

  ImageCapture({Key key, @required this.changeImage}) : super(key: key);

  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar',
        toolbarColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        activeControlsWidgetColor: Theme.of(context).primaryColor,
        statusBarColor: kBackgroundColor,
        toolbarWidgetColor: Theme.of(context).primaryColor,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await ImagePicker().getImage(source: source);

    setState(() {
      _imageFile = File(selected.path);
    });
  }

  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _imageFile != null
          ? Container(
              child: Text(""),
            )
          : Container(
              height: 64,
              color: Theme.of(context).backgroundColor.withOpacity(0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(FeatherIcons.camera),
                    color: kTextColor,
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  IconButton(
                    icon: Icon(FeatherIcons.image),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
            ),
      body: Column(
        children: [
          Expanded(
            child: _imageFile != null
                ? ListView(
                    children: [
                      if (_imageFile != null) ...[
                        Image(
                          image: FileImage(_imageFile),
                        ),
                      ]
                    ],
                  )
                : Center(
                    child: Text(
                      "Selecione ou tire uma foto!",
                      style: SubTitleTextStyle,
                    ),
                  ),
          ),
          _imageFile != null
              ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              FeatherIcons.crop,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: _cropImage,
                          ),
                          IconButton(
                            icon: Icon(FeatherIcons.delete, color: kTextColor),
                            onPressed: _clear,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: RoundedButton(
                        text: "Salvar",
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          widget.changeImage(_imageFile.path);
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
