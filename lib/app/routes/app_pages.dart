import 'package:get/get.dart';
import 'package:indivara_test/config/constant.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_pokemon/bindings/detail_pokemon_binding.dart';
import '../modules/detail_pokemon/views/detail_pokemon_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_pokemons/bindings/list_pokemons_binding.dart';
import '../modules/list_pokemons/views/list_pokemons_view.dart';
import '../modules/my_pokemon/bindings/my_pokemon_binding.dart';
import '../modules/my_pokemon/views/my_pokemon_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MY_POKEMON,
      page: () => const MyPokemonView(),
      binding: MyPokemonBinding(),
    ),
    GetPage(
      name: _Paths.LIST_POKEMONS,
      page: () => const ListPokemonsView(),
      binding: ListPokemonsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POKEMON,
      page: () => const DetailPokemonView(),
      binding: DetailPokemonBinding(),
      transitionDuration: kDefaultDuration
    ),
  ];
}
