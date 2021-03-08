import 'package:capyba_challenge/components/custom_error_load.dart';
import 'package:capyba_challenge/components/custom_progress_indicator.dart';
import 'package:capyba_challenge/components/header_screen_item.dart';
import 'package:capyba_challenge/components/publication.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/navigations/screen_arguments/specific_publication_arguments.dart';
import 'package:capyba_challenge/navigations/screen_arguments/user_profile_arguments.dart';
import 'package:capyba_challenge/screens/camera/camera_screen.dart';
import 'package:capyba_challenge/screens/new_publication/new_publication_screen.dart';
import 'package:capyba_challenge/screens/profile/profile_screen.dart';
import 'package:capyba_challenge/screens/specific_publication/specific_publication_screen.dart';
import 'package:capyba_challenge/utils/message_confirm_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final publicationController = Provider.of<PublicationController>(context);
    final publications = Provider.of<List<Future<PublicationModel>>>(context);

    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Center(
                  child: HeaderScreenItem(
                    titleHeaderItem: "Nova publicação",
                    onClick: () {
                      if (user.activated) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraScreen(
                              changeImage: publicationController.onSavedImage,
                              navigationFunction: () {
                                Navigator.of(context)
                                    .pushNamed(NewPublicationScreen.routeName);
                              },
                            ),
                          ),
                        );
                      } else {
                        showMessageConfirmAccount(context);
                      }
                    },
                    bottomLine: true,
                    iconHeaderItem: FeatherIcons.plus,
                  ),
                ),
              ),
              publications != null
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: publications.length,
                        itemBuilder: (_, index) {
                          return FutureBuilder<PublicationModel>(
                            future: publications[index],
                            builder: (context, snapshot) {
                              Widget children;
                              if (snapshot.hasData) {
                                children = Container(
                                  padding: EdgeInsets.only(bottom: 28.0),
                                  child: Publication(
                                    whoPublished: snapshot.data.user.name,
                                    whoPublishedImage:
                                        snapshot.data.user.avatarAddress,
                                    description:
                                        snapshot.data.description != null
                                            ? snapshot.data.description
                                            : "",
                                    onClickImage: () {
                                      if (user.activated) {
                                        Navigator.pushNamed(
                                          context,
                                          SpecificPublicationScreen.routeName,
                                          arguments:
                                              SpecificPublicationArguments(
                                            snapshot.data.uid,
                                          ),
                                        );
                                      } else {
                                        showMessageConfirmAccount(context);
                                      }
                                    },
                                    onClickProfile: () {
                                      if (user.activated) {
                                        Navigator.pushNamed(
                                          context,
                                          ProfileScreen.routeName,
                                          arguments: UserProfileArguments(
                                            snapshot.data.user.uid,
                                          ),
                                        );
                                      } else {
                                        showMessageConfirmAccount(context);
                                      }
                                    },
                                    urlImage: snapshot.data.imageAddress,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                children = CustomErrorLoad(
                                  errorMessage: snapshot.error.toString(),
                                );
                              }
                              return Container(
                                child: children,
                              );
                            },
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomProgressIndicator(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
