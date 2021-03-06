import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:capyba_challenge/screens/specific_publication/specific_publication_screen.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/components/profile_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            ProfileItem(
              title: "Joao Silva",
              titleTextStyle: InputTextStyle,
              radiusAvatar: 45.0,
              paddingTopTitles: 4.0,
              subTitleTextStyle: TextTextStyle.copyWith(
                fontSize: 14.0,
                color: kInactiveColor,
              ),
              subTitle:
                  "It is a long be distracted by the readable con content of a page when...",
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
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 2 / 2,
                children: List.generate(
                  20,
                  (index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, SpecificPublicationScreen.routeName),
                      splashColor: Theme.of(context).primaryColor,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1534179639155-4910efc143c0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
