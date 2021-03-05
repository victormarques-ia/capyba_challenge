import 'package:capyba_challenge/controllers/new_publication_controller.dart';
import 'package:capyba_challenge/navigations/routes.dart';
import 'package:capyba_challenge/services/auth_service.dart';
import 'package:capyba_challenge/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/theme.dart';
import 'package:provider/provider.dart';

import 'controllers/user_form_controller.dart';
import 'models/user_model.dart';

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
          create: (context) => UserFormController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewPublicationController(),
        ),
      ],
      child: MaterialApp(
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
