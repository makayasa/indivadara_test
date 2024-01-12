import 'package:get/get.dart';

import '../controllers/my_pokemon_controller.dart';

class MyPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPokemonController>(
      () => MyPokemonController(),
    );
  }
}
