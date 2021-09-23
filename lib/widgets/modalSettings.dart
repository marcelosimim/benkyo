import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalSettings extends StatefulWidget {
  const ModalSettings({Key? key, required this.isRunning}) : super(key: key);

  final bool isRunning;

  @override
  _ModalSettingsState createState() => _ModalSettingsState();
}

class _ModalSettingsState extends State<ModalSettings> {
  @override
  Widget build(BuildContext context) {
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
                        icon: Icon(Icons.pause),
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
  }
}
