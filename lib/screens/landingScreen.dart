import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    'Porque o seu tempo voa e o Benkyō voa com você',
                    textAlign: TextAlign.center,
                  )),
              RotationTransition(
                turns: new AlwaysStoppedAnimation(0.20),
                child: SvgPicture.asset(
                  'assets/images/flyingman.svg',
                  width: 500,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text('Registre-se')),
                      ElevatedButton(onPressed: () {}, child: Text('Login')),
                    ],
                  ))
            ],
          )),
    );
  }
}
