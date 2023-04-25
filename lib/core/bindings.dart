import 'package:get/get.dart';
import 'package:wave_app/controller/circle_controller.dart';
import 'package:wave_app/controller/start_controller.dart';
import 'package:wave_app/controller/wave_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WaveController());
    //Get.put(WaveController());
    // Get.lazyPut(() => CircleController());
    Get.put(CircleController());
    Get.lazyPut(() => StartController());
    //Get.put(StartController());
  }
}
