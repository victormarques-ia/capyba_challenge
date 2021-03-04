import 'package:capyba_challenge/components/user_avatar.dart';
import 'package:capyba_challenge/controllers/user_form_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/screens/camera/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../../../controllers/user_form_controller.dart';
import 'register_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(context);

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 40.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Stack(
                    children: [
                      UserAvatar(
                        userAvatarImage: userFormController.user.avatarAddress,
                      ),
                      cameraWidget(context, userFormController),
                    ],
                  ),
                ),
                RegisterForm(
                  userFormController: userFormController,
                )
              ],
            ),
          ),
        ],
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
              changeImage: userFormController.changeAvatar,
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
