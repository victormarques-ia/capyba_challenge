import 'package:capyba_challenge/components/custom_error_load.dart';
import 'package:capyba_challenge/components/custom_progress_indicator.dart';
import 'package:capyba_challenge/components/user_avatar.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/screens/camera/camera_screen.dart';
import 'package:capyba_challenge/screens/profile_configurations/components/profile_configurations_form.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(context);
    final _authService = AuthService();

    return SafeArea(
      child: FutureBuilder<UserModel>(
        future: _authService.getUserData(),
        builder: (context, snapshot) {
          Widget children;
          if (snapshot.hasData) {
            children = ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Stack(
                          children: [
                            UserAvatar(
                              urlAvatarImage: snapshot.data.avatarAddress,
                              userAvatarImage:
                                  userFormController.user.avatarAddress,
                            ),
                            cameraWidget(context, userFormController),
                          ],
                        ),
                      ),
                      ProfileConfigurationsForm(
                        initialData: snapshot.data,
                      )
                    ],
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            children = CustomErrorLoad(
              errorMessage: snapshot.error.toString(),
            );
          } else {
            children = Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomProgressIndicator(),
                  ),
                ),
              ],
            );
          }

          return children;
        },
      ),
    );
  }

  Positioned cameraWidget(
    BuildContext context,
    UserFormController userFormController,
  ) {
    return new Positioned(
      bottom: 8.0,
      right: 0.0,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraScreen(
              changeImage: userFormController.onSavedAvatar,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: kDetailsColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            FeatherIcons.camera,
            size: 18.0,
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
