import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleController extends GetxController {
  String? text1 = '';
  String? text2 = '';
  modes m = modes.mod1;
  double? angleSecond;
  bool _isColor = false;
  bool get isColor => _isColor;
  List<Color> arrColors = [Colors.white, Colors.yellowAccent];

  @override
  void onInit() {
    super.onInit();
    angle();
  }

  changeColor11() {
    _isColor = true;
    update();
    Timer(const Duration(seconds: 1), () {
      _isColor = false;
    });
    update();
  }

  angle() {
    final second = DateTime.now().second.toDouble();
    angleSecond = (-pi * (second / -12)) * 2;

    if ((m == modes.mod2 && second == 12) ||
        (m == modes.mod2 && second == 24) ||
        (m == modes.mod2 && second == 36) ||
        (m == modes.mod2 && second == 48) ||
        (m == modes.mod2 && second == 0)) {
      changeColor11();
    }

    switch (m) {
      case (modes.mod2):
        switch (second.toInt()) {
          case 6:
            {
              playSound();
            }
            break;
          case 12:
            {
              playSound();
            }
            break;
          case 18:
            {
              playSound();
            }
            break;
          case 24:
            {
              playSound();
            }
            break;
          case 30:
            {
              playSound();
            }
            break;
          case 36:
            {
              playSound();
              print('mod = 2 sacend =  36 ');
            }
            break;
          case 42:
            {
              playSound();
              print('mod = 2 sacend =  42 ');
            }
            break;
          case 48:
            {
              playSound();
              print('mod = 2 sacend =  48 ');
            }
            break;
          case 54:
            {
              playSound();
              print('mod = 2 sacend =  56 ');
            }
            break;
          case 0:
            {
              playSound();
              print('mod = 2 sacend =  0 ');
            }
            break;
          default:
            print('No Sound mod = 2');
        }
        break;
      case modes.mod3:
        switch (second.toInt()) {
          // case 6:
          //   playSound();
          //   break;
          case 12:
            {
              playSound();
              print('mod = 3 sacend =  12 ');
            }

            break;
          // case 18:
          //   playSound();
          //   break;
          case 24:
            {
              playSound();
            }

            break;
          // case 30:
          //   playSound();
          //   break;
          case 36:
            {
              playSound();
            }
            break;
          // case 42:
          //   playSound();
          //   break;
          case 48:
            {
              playSound();
            }
            break;
          // case 54:
          //   playSound();
          //   break;
          case 0:
            {
              playSound();
            }

            break;
          default:
            print('No Sound mod = 3');
        }
        break;
      case modes.mod4:
        switch (second.toInt()) {
          case 6:
            {
              playSound();
              print('mod = 4 sacend =  6 ');
            }
            break;
          case 12:
            {
              playSound();
              print('mod = 4 sacend =  12 ');
            }
            break;
          case 18:
            {
              playSound();
              print('mod = 4 sacend =  18 ');
            }
            break;
          case 24:
            {
              playSound();
              print('mod = 4 sacend =  24 ');
            }
            break;
          case 30:
            {
              playSound();
              print('mod = 4 sacend =  30 ');
            }
            break;
          case 36:
            {
              playSound();
              print('mod = 4 sacend =  36 ');
            }
            break;
          case 42:
            {
              playSound();
              print('mod = 4 sacend =  42 ');
            }
            break;
          case 48:
            {
              playSound();
              print('mod = 4 sacend =  48 ');
            }
            break;
          case 54:
            {
              playSound();
              print('mod = 4 sacend =  56 ');
            }
            break;
          case 0:
            {
              playSound();
              print('mod = 4 sacend =  0 ');
            }
            break;
          default:
            print('No Sound mod = 4');
        }
        break;
      case modes.mod5:
        switch (second.toInt()) {
          case 6:
            {
              playSound();
              print('mod = 5 sacend =  6 ');
            }
            break;
          case 12:
            {
              playSound();
              print('mod = 5 sacend =  12 ');
            }
            break;
          case 18:
            {
              playSound();
              print('mod = 5 sacend =  18 ');
            }
            break;
          case 24:
            {
              playSound();
              print('mod = 5 sacend =  24 ');
            }
            break;
          case 30:
            {
              playSound();
              print('mod = 5 sacend =  30 ');
            }
            break;
          case 36:
            {
              playSound();
              print('mod = 5 sacend =  36 ');
            }
            break;
          case 42:
            {
              playSound();
              print('mod = 5 sacend =  42 ');
            }
            break;
          case 48:
            {
              playSound();
              print('mod = 5 sacend =  48 ');
            }
            break;
          case 54:
            {
              playSound();
              print('mod = 5 sacend =  56 ');
            }
            break;
          case 0:
            {
              playSound();
              print('mod = 5 sacend =  0 ');
            }
            break;
          default:
            print('No Sound mod = 5');
        }
        break;

      default:
        print('mod1 on');
        text1 = '';
        text2 = '';
    }

    return angleSecond;
  }

  void playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sound.mp3'));
  }

  void handleModeSelected() {
    if (m == modes.mod1) {
      text1 = 'inhale';
      text2 = 'exhale';
      print('mod === 1 on >> 2');
      m = modes.mod2;
    } else if (m == modes.mod2) {
      text1 = 'inhale';
      text2 = 'hold';

      print('mod === 2 on >> 3');
      m = modes.mod3;
    } else if (m == modes.mod3) {
      text1 = 'exhale';
      text2 = 'hold';

      print('mod === 3 on >> 4');
      m = modes.mod4;
    } else if (m == modes.mod4) {
      text1 = 'hold';
      text2 = 'inhale';
      print('mod === 4 on >> 5');
      m = modes.mod5;
    } else if (m == modes.mod5) {
      text1 = '';
      text2 = '';
      print('mod === 5 on >> 1');
      m = modes.mod1;
    } else {}
    update();
  }
}

enum modes { mod0, mod1, mod2, mod3, mod4, mod5 }
