import 'package:benkyo/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ModalSettings extends StatefulWidget {
  const ModalSettings({Key? key, required this.isRunning}) : super(key: key);

  final bool isRunning;

  @override
  _ModalSettingsState createState() => _ModalSettingsState();
}

class _ModalSettingsState extends State<ModalSettings> {
  int? interval;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                child: widget.isRunning ? null : Text('Intervalos de: '),
              ),
            ),
            Container(
              width: 300,
              alignment: Alignment.center,
              child: widget.isRunning
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.pause,),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.stop),
                        ),
                      ],
                    )
                  : CupertinoPicker(
                      itemExtent: 64,
                      onSelectedItemChanged: (int value) {
                        print(value);
                        int minutes;
                        switch (value) {
                          case 0:
                            minutes = 5;
                            break;
                          case 1:
                            minutes = 10;
                            break;
                          case 2:
                            minutes = 15;
                            break;
                          default:
                            minutes = 5;
                        }
                        model.setInterval(minutes);
                      },
                      children: [
                          Center(
                            child: Text(
                              '5 minutos',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Center(
                            child: Text('10 minutos',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Center(
                            child: Text('15 minutos',
                                style: TextStyle(color: Colors.white)),
                          )
                        ]),
            )
          ],
        ),
      );
    });
  }
}
