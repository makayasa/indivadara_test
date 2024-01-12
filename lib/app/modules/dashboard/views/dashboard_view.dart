import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indivara_test/app/modules/dashboard/components/navigation_bar_item.dart';
import 'package:indivara_test/app/modules/list_pokemons/views/list_pokemons_view.dart';
import 'package:indivara_test/app/modules/my_pokemon/views/my_pokemon_view.dart';
import 'package:indivara_test/config/color_constants.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [
                  ListPokemonsView(),
                  MyPokemonView(),
                ],
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Expanded(
                    child: NavigationBarItem(
                      image: controller.pageIndex.value == 0 ? 'assets/pointer.png' : 'assets/pointer_inactive.png',
                      label: 'Catch Pokemon',
                      labelColor: controller.pageIndex.value == 0 ? kPrimaryColor : null,
                      onTap: () => controller.changePage(0),
                    ),
                  ),
                ),
                Obx(
                  () => Expanded(
                    child: NavigationBarItem(
                      image: controller.pageIndex.value == 1 ? 'assets/pokeball.png' : 'assets/pokeball_inactive.png',
                      label: 'My Pokemon',
                      labelColor: controller.pageIndex.value == 1 ? kPrimaryColor : null,
                      onTap: () => controller.changePage(1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
