import 'package:benkyo/models/userModel.dart';
import 'package:benkyo/widgets/modalSettings.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;
  double progressIndicatorSize = 200;
  double time = 0.5;
  int? interval;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Benkyō | 勉強'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.settings),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalSettings(isRunning: isRunning,);
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
                  padding: EdgeInsets.only(top: 20, bottom: 100),
                  child: Container(
                    child: isRunning
                        ? null
                        : Text(
                            'Bem vindo(a), ${model.userData['name']}! Vamos começar?'),
                  ),
                ),
                Container(
                  width: progressIndicatorSize,
                  height: progressIndicatorSize,
                  child: CircularProgressIndicator(
                    value: isRunning ? time : null,
                    strokeWidth: 15,
                    color: Colors.white60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: isRunning
                      ? Text('Tempo de estudo')
                      : ElevatedButton(
                          child: Text('COMEÇAR'),
                          onPressed: () {},
                        ),
                ),
                Container(
                  child: isRunning ? Text('${time}') : null,
                ),
                ElevatedButton(
                  child: Text('TESTE'),
                  onPressed: () {
                    isRunning = !isRunning;
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        }));
  }
}
