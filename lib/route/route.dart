import 'package:flutter/material.dart';
import 'package:benkyo/screens/homeScreen.dart';
import 'package:benkyo/screens/landingScreen.dart';
import 'package:benkyo/screens/login.dart';
import 'package:benkyo/screens/register.dart';
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