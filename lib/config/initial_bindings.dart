import 'package:get/get.dart';
import 'package:indivara_test/app/controllers/network_controller.dart';
import 'package:indivara_test/app/modules/my_pokemon/controllers/my_pokemon_controller.dart';
import 'package:indivara_test/app/modules/my_pokemon/views/my_pokemon_view.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
    Get.put(MyPokemonController());
  }

}
