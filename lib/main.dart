import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wave_app/core/bindings.dart';
import 'package:wave_app/data/time_saved.dart';
import 'package:wave_app/startapp/start_app.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TimeSavedAdapter());
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    // Log the error and stack trace
    print('Caught an error: $error');
    print(stackTrace);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlutterStopWatch(),
        initialBinding: Binding(),
      );
    });
  }
}

///https://coherence.com/coherence_clock.html