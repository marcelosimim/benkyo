import 'package:benkyo/route/route.dart' as route;
import 'package:benkyo/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/userModel.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      onGenerateRoute: route.controller,
      initialRoute: route.landingPage,
    ));
  }
}

