import 'dart:async';
import 'package:benkyo/models/userModel.dart';
import 'package:benkyo/widgets/modalSettings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:benkyo/route/route.dart' as route;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //teste
  bool isRunning = false;
  bool intervalTime = false;
  int defaultMinute = 25;
  int currentTime = 25*60;
  int minutes = 25;
  int seconds = 60;
  Timer? timer;
  double percent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Benkyō | 勉強'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, route.landingPage, (route) => false);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.settings),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalSettings();
                  });
            }),
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    child: isRunning
                        ? Text('')
                        : Text(
                            'Bem vindo(a), ${model.userData['name']}! Vamos começar?'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: CircularPercentIndicator(
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 250,
                    lineWidth: 15,
                    progressColor: Color(0xFF444053),
                    backgroundColor: Colors.white70,
                    center: Text(
                      '${minutes}:${_secondsConverted()}',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: isRunning
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: IconButton(
                                  color: Color(0xFFE1E1E6),
                                  onPressed: () {
                                    isRunning = false;
                                    timer?.cancel();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.pause,
                                    size: 80,
                                  )),
                            ),
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: IconButton(
                                    color: Color(0xFFE1E1E6),
                                    onPressed: () {
                                      intervalTime = false;
                                      isRunning = false;
                                      timer?.cancel();
                                      minutes = defaultMinute;
                                      seconds = 60;
                                      percent = 0;
                                      currentTime = defaultMinute*60;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.stop,
                                      size: 80,
                                    ))),
                          ],
                        )
                      : ElevatedButton(
                          child: Text('COMEÇAR'),
                          onPressed: () {
                            isRunning = true;
                            _callTimer(model.userData['interval']);
                            setState(() {});
                          },
                        ),
                ),
              ],
            ),
          );
        }));
  }

  _callTimer(int interval) {
    int totalTime = currentTime;
    double secPercent = (totalTime / 100);
    if (intervalTime) {
      _intervalTimer(totalTime, secPercent, interval);
    } else {
      _startTimer(totalTime, secPercent, interval);
    }
  }

  _startTimer(totalTime, secPercent, interval) {
    print('start timer');
    double increment = 1/(defaultMinute*60);
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        print('total time ${totalTime} : minutes ${minutes} : seconds ${seconds}');
        setState(() {
          if (totalTime - 1 > 0) { //se ainda estiver rodando o tempo
          totalTime--; // diminui o contator total
          seconds--; //diminui os segundos que aparecem para o usuário
          currentTime--;
          if (seconds == 59) { //se segundos forem = 59, virou um minuto
            minutes--;
          }
          if (totalTime % 60 == 0) { //virou o minuto
            minutes--;
            seconds = 59;
          }
            if (percent + increment <= 1) {
              percent += increment;
            } else {
              percent = 1;
            }
        } else { //se o cronometro tiver chegado em 0
          timer.cancel();
          intervalTime = true;

          setState(() {
            percent = 0;
            minutes = 0;
            seconds = 0;
          });

          int totalIntervalTime = interval * 60;
          double secPercent = (totalIntervalTime / 100);

          currentTime = interval*60;
          minutes = interval;
          seconds = 60;
          _intervalTimer(totalIntervalTime, secPercent, interval);
        }
      });
    });
  }

  _intervalTimer(totalTime, secPercent, interval) {
    print('start interval');
    double increment = 1/(interval*60);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('total time ${totalTime} : minutes ${minutes} : seconds ${seconds}');
      setState(() {
        if (totalTime - 1 > 0) {
          totalTime--;
          seconds--;
          currentTime--;
          if (seconds == 59) {
            minutes--;
          }
          if (totalTime % 60 == 0) {
            minutes--;
            seconds = 59;
          }
            if (percent + increment <= 1) {
              percent += increment;
            } else {
              percent = 1;
            }

        } else {
          intervalTime = false;
          isRunning = false;
          currentTime = defaultMinute*60;
          timer.cancel();
          setState(() {
            percent = 0;
            minutes = defaultMinute;
            seconds = 60;
          });
        }
      });
    });
  }

  String _secondsConverted(){
      if(seconds == 60){
        return '00';
      }else if(seconds < 10){
        return '0${seconds}';
      }else{
        return seconds.toString();
      }
  }
}
