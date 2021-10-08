import 'dart:async';
import 'package:screen_brightness/screen_brightness.dart';

class Brightness{

  Timer? timer;
  int time = 0;

  Future<double> get initialBrightness async {
    try {
      return await ScreenBrightness.initial;
    } catch (e) {
      print(e);
      throw 'Failed to get initial brightness';
    }
  }

  Future<double> get currentBrightness async {
    try {
      return await ScreenBrightness.current;
    } catch (e) {
      print(e);
      throw 'Failed to get current brightness';
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness.setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness.resetScreenBrightness();
    } catch (e) {
      print(e);
      throw 'Failed to reset brightness';
    }
  }

  Future<void> attention() async {
    print('attention');
    bool on = true;
    time = 0;
    try{
      timer = Timer.periodic(Duration(milliseconds: 900), (timer) {
          if(time <= 10){
            on ? setBrightness(0) : setBrightness(1);
            on = !on;
            time += 1;
          }else{
            timer.cancel();
            setBrightness(1);
          }
      });
    }catch(e){
      print(e);
      throw 'Failed to alert';
    }
  }
}