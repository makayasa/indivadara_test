import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivara_test/app/data/pokemon/pokemon.dart';
import 'package:indivara_test/config/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPokemonController extends GetxController {
  final myPokemons = <Pokemon>[].obs;

  ScrollController scrollController = ScrollController();

  Future<void> getMyPokemons() async {
    final pref = await SharedPreferences.getInstance();
    final res = pref.getStringList(kMypokemonsKey) ?? [];
    myPokemons.clear();
    for (var e in res) {
      final decode = json.decode(e);
      final pokemon = Pokemon.fromJson(decode);
      myPokemons.add(pokemon);
    }
  }

  void deletePokomen(int index) async {
    final pref = await SharedPreferences.getInstance();
    var res = pref.getStringList(kMypokemonsKey) ?? [];
    myPokemons.removeAt(index);
    res.removeAt(index);
    await pref.setStringList(kMypokemonsKey, res);
  }

  void initialFunction() async {
    await getMyPokemons();
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
