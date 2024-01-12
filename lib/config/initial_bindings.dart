import 'package:get/get.dart';
import 'package:indivara_test/app/controllers/network_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }

}
