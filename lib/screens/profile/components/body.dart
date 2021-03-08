import 'package:capyba_challenge/components/custom_error_load.dart';
import 'package:capyba_challenge/components/custom_progress_indicator.dart';
import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/models/publication_model.dart';
import 'package:capyba_challenge/models/user_model.dart';
import 'package:capyba_challenge/screens/specific_publication/specific_publication_screen.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/components/profile_item.dart';
import 'package:provider/provider.dart';

import '../../../navigations/screen_arguments/specific_publication_arguments.dart';

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

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            FutureBuilder<UserModel>(
              future: publicationController
                  .getSelectedUser(userUid != null ? userUid : user.uid),
              builder: (context, snapshot) {
                Widget children;
                if (snapshot.hasData) {
                  children = ProfileItem(
                    title: snapshot.data.name != null ? snapshot.data.name : "",
                    avatarImage: snapshot.data.avatarAddress,
                    titleTextStyle: InputTextStyle,
                    radiusAvatar: 45.0,
                    paddingTopTitles: 4.0,
                    subTitleTextStyle: TextTextStyle.copyWith(
                      fontSize: 14.0,
                      color: kInactiveColor,
                    ),
                    subTitle:
                        snapshot.data.bio != null ? snapshot.data.bio : "",
                  );
                } else if (snapshot.hasError) {
                  children = CustomErrorLoad(errorMessage: snapshot.error);
                } else {
                  children = Container();
                }

                return children;
              },
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
            Flexible(
              child: FutureBuilder<List<PublicationModel>>(
                future: publicationController.getUserSpecificPublications(
                    userUid != null ? userUid : user.uid),
                builder: (context, snapshot) {
                  Widget children;
                  if (snapshot.hasData) {
                    children = GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 2,
                      children: List.generate(
                        snapshot.data.length,
                        (index) {
                          PublicationModel publication = snapshot.data[index];

                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              SpecificPublicationScreen.routeName,
                              arguments:
                                  SpecificPublicationArguments(publication.uid),
                            ),
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
                    );
                  } else if (!snapshot.hasData) {
                    children = Text(
                      "Você não possui nenhuma publicação ainda!",
                      style: TextTextStyle,
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
            )
          ],
        ),
      ),
    );
  }
}
