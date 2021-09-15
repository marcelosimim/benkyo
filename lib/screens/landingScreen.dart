import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:benkyo/route/route.dart' as route;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 1000,
          child: RotationTransition(
            turns: new AlwaysStoppedAnimation(0.20),
            child: SvgPicture.asset(
              'assets/images/flyingman.svg',
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'Porque o seu tempo voa e o Benkyō voa com você',
              textAlign: TextAlign.center,
            )),
        Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route.registerPage);
                      },
                      child: Text('Registre-se'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF444053),
                        textStyle:
                            GoogleFonts.poppins(color: Color(0xFF1C1C24)),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route.loginPage);
                      },
                      child: Text('Login', style: GoogleFonts.poppins(color: Color(0xFFE1C1C24)),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFE1E1E6),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      )),
                ],
              )),
        )
      ],
    ));
  }
}
