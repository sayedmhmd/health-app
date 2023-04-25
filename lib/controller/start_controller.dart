import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wave_app/data/time_saved.dart';

class StartController extends GetxController {
  int ss = 0;
  int mm = 0;
  int hh = 0;
  int dd = 0;
  int momo = 0;
  int yy = 0;

  Stream<int>? timerStream;
  StreamSubscription<int>? timerSubscription;
  String yearStr = '00';
  String monthStr = '00';
  String dayStr = '00';
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';
  late Box box;
  TimeSaved? timeSaved;
  bool flag = true;
  @override
  void onInit() async {
    super.onInit();

    timeSaved =
        TimeSaved(second: 0, minut: 0, hour: 0, day: 0, month: 0, year: 0);
    box = await Hive.openBox('box');

    startbtn();
  }

  startbtn() {
    timerStream = stopWatchStream();
    timerSubscription = timerStream!.listen((int newTick) {
      yearStr = ((yy + newTick / (60 * 60 * 24 * 365)) % 60)
          .floor()
          .toString()
          .padLeft(2, '0');
      monthStr = ((momo + newTick / (60 * 60 * 24 * 30)) % 60)
          .floor()
          .toString()
          .padLeft(2, '0');
      dayStr = ((dd + newTick / (60 * 60 * 24)) % 60)
          .floor()
          .toString()
          .padLeft(2, '0');
      hoursStr =
          ((hh + newTick / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
      minutesStr =
          ((mm + newTick / (60)) % 60).floor().toString().padLeft(2, '0');
      secondsStr = ((newTick) % 60).floor().toString().padLeft(2, '0');
    });

    update();
    getTime();
  }

  Stream<int> stopWatchStream() {
    StreamController<int>? streamController;
    Timer? timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer!.cancel();
        timer = null;
        counter = 0;
        streamController!.close();
      }
    }

    void tick(_) {
      counter++;
      streamController!.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );
    return streamController.stream;
  }

  getTime() {
    timeSaved = box.get('timeSaved');

    ss = timeSaved!.second ?? 0;
    mm = timeSaved!.minut ?? 0;
    hh = timeSaved!.hour ?? 0;
    dd = timeSaved!.day ?? 0;
    momo = timeSaved!.month ?? 0;
    yy = timeSaved!.year ?? 0;
    update();
  }

  saveTimeStart() async {
    box = await Hive.openBox('box');
    box.put(
        'timeSaved',
        TimeSaved(
            second: int.parse(secondsStr),
            minut: int.parse(minutesStr),
            hour: int.parse(hoursStr),
            day: int.parse(dayStr),
            month: int.parse(monthStr),
            year: int.parse(yearStr)));

    print('secont time is = $secondsStr');
    // Storage.saveTime(int.parse(s!), int.parse(m!), int.parse(h!), int.parse(d!),
    //     int.parse(mo!), int.parse(y!));
    update();
    print('on Saved mod on');
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      // exit(0);
      Future.delayed(const Duration(milliseconds: 1000), () {
        exit(0);
      });
    }
  }

  resetbtn() {
    timerSubscription!.cancel();
    timerStream = null;
    print("second is ==== $secondsStr");

    yearStr = '00';
    monthStr = '00';
    dayStr = '00';
    hoursStr = '00';
    minutesStr = '00';
    secondsStr = '00';

    update();
  }
}
