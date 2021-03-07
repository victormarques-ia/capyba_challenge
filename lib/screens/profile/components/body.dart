import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/screens/specific_publication/specific_publication_screen.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/components/profile_item.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final String userUid;

  const Body({
    Key key,
    @optionalTypeArgs this.userUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final publicationController = Provider.of<PublicationController>(context);

    if (userUid != null) {
      publicationController.getUserSpecificPublications(userUid);
    } else {
      publicationController.getUserSpecificPublications(user.uid);
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            ProfileItem(
              title:
                  publicationController.specificUserPublications[0].user.name,
              titleTextStyle: InputTextStyle,
              radiusAvatar: 45.0,
              paddingTopTitles: 4.0,
              subTitleTextStyle: TextTextStyle.copyWith(
                fontSize: 14.0,
                color: kInactiveColor,
              ),
              subTitle:
                  publicationController.specificUserPublications[0].user.bio,
            ),
            SizedBox(
              height: 30.0,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  width: constraints.maxWidth / 3,
                  child: Divider(
                    color: Theme.of(context).primaryColor,
                    thickness: 1.5,
                  ),
                );
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            publicationController.specificUserPublications != null
                ? Flexible(
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 2,
                      children: List.generate(
                        publicationController.specificUserPublications.length,
                        (index) {
                          PublicationModel publication = publicationController
                              .specificUserPublications[index];

                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, SpecificPublicationScreen.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 4),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    publication.imageAddress,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : null,
          ],
        ),
      ),
    );
  }
}
