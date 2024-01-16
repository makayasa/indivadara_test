import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivara_test/app/components/default_dialog.dart';
import 'package:indivara_test/app/data/pokemon/pokemon.dart';
import 'package:indivara_test/app/routes/app_pages.dart';
import 'package:indivara_test/config/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/function_utils.dart';

class MyPokemonController extends GetxController {
  final myPokemons = <Pokemon>[].obs;

  ScrollController scrollController = ScrollController();

  void detailMyPokemon(int index) {
    Get.toNamed(
      Routes.DETAIL_POKEMON,
      arguments: {
        'is_cathed': true,
        'id': myPokemons[index].id,
        // 'data': myPokemons[index].toJson(),
        'data': myPokemons[index].toJson(),
      },
    );
  }

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
    bool isDelete = await Get.dialog(
          DefaultDialog(
            title: 'Are you sure want to release this pokemon?',
            icon: Icons.help_outline_outlined,
            seccondButton: true,
            onTap: () {
              Get.back(
                result: true,
              );
            },
            onTapSeccondButton: () {
              Get.back(
                result: false,
              );
            },
          ),
        ) ??
        false;
    logKey('isDelete', isDelete);
    if (!isDelete) {
      return;
    }
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
}
