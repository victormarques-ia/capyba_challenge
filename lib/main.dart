import 'package:capyba_challenge/controllers/publication_controller.dart';
import 'package:capyba_challenge/navigations/routes.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:capyba_challenge/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/theme.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider(
          create: (context) => PublicationController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Capyba Challenge',
        debugShowCheckedModeBanner: false,
        theme: defaultThemeData(context),
        darkTheme: defaultThemeData(context),
        home: Wrapper(),
        routes: routes,
      ),
    );
  }
}
