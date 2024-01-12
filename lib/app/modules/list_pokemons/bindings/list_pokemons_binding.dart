import 'package:get/get.dart';

import '../controllers/list_pokemons_controller.dart';

class ListPokemonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPokemonsController>(
      () => ListPokemonsController(),
    );
  }
}
