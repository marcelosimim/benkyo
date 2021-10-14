import 'package:flutter/material.dart';
import 'package:benkyo/screens/homeScreen.dart';
import 'package:benkyo/screens/firstScreen.dart';
import 'package:benkyo/screens/loginScreen.dart';
import 'package:benkyo/screens/registerScreen.dart';
import 'package:benkyo/screens/splashScreen.dart';

const String splashScreen = 'splashScreen';
const String landingPage = 'landing';
const String loginPage = 'login';
const String registerPage = 'register';
const String homePage = 'home';

Route<dynamic> controller(RouteSettings setting){

  switch(setting.name){
    case splashScreen:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case landingPage:
      return MaterialPageRoute(builder: (context) => LandingScreen());
    case loginPage:
      return MaterialPageRoute(builder: (context) => Login());
    case registerPage:
      return MaterialPageRoute(builder: (context) => Register());
    case homePage:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default:
      throw ('PAGE NOT FOUND!');
  }
}