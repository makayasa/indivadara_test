import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivara_test/app/components/default_dialog.dart';
import 'package:indivara_test/app/controllers/network_controller.dart';
import 'package:indivara_test/app/data/pokemon/pokemon.dart';
import 'package:dio/dio.dart' as dio;
import 'package:indivara_test/app/modules/my_pokemon/controllers/my_pokemon_controller.dart';
import 'package:indivara_test/config/color_constants.dart';
import 'package:indivara_test/config/constant.dart';
import 'package:indivara_test/config/environment.dart';
import 'package:indivara_test/config/function_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPokemonController extends GetxController {
  final network = Get.find<NetworkController>();
  final data = Pokemon().obs;

  final isCatched = false.obs;
  var id = ''.obs;

  final isLoading = true.obs;

  void floatingButton() async {
    final res = await checkPokemonExist();
    if (res) {
      return;
    }
    Get.dialog(
      DefaultDialog(
        icon: Icons.help_outline,
        title: 'Are you sure want to catch this pokemon',
        seccondButton: true,
        onTapSeccondButton: () {
          Get.back();
        },
        onTap: () {
          Get.back();
          catchPokemon();
        },
      ),
    );
  }

  Future<bool> checkPokemonExist() async {
    final pref = await SharedPreferences.getInstance();
    var temp = pref.getStringList(kMypokemonsKey) ?? [];
    for (var e in temp) {
      final decode = json.decode(e);
      final pokemon = Pokemon.fromJson(decode);
      if (id.value == pokemon.id.toString()) {
        // showToast('ada');
        Get.dialog(
          const DefaultDialog(
            icon: Icons.cancel_outlined,
            title: 'You already owned this Pokemon!',
          ),
        );
        return true;
      }
    }
    return false;
  }

  void catchPokemon() async {
    final rng = Random().nextInt(2);
    if (rng == 0) {
      Get.dialog(
        const DefaultDialog(
          icon: Icons.cancel_outlined,
          title: 'Failed to catch the Pokemon!',
        ),
      );
      return;
    }
    final pref = await SharedPreferences.getInstance();
    var temp = pref.getStringList(kMypokemonsKey) ?? [];
    final encoded = json.encode(data.toJson());
    logKey('encoded', encoded);
    temp.add(json.encode(data.toJson()));
    pref.setStringList(kMypokemonsKey, temp);
    final myPokemonC = Get.find<MyPokemonController>();
    await myPokemonC.getMyPokemons();
    Get.dialog(
      const DefaultDialog(
        icon: Icons.check_circle_outline,
        title: "You're successfully catch the Pokemon!",
      ),
    );
    // showToast('cath');
  }

  Future<void> getDetailPokemon() async {
    try {
      dio.Response res = await network.get('$baseUrl/pokemon/${id.value}');
      // logKey('res getDetailPokemon', res);
      final temp = res.data['sprites']['versions']['generation-vi']['x-y'] ?? {};
      if (isNotEmpty(temp)) {
        res.data['sprites']['versions']['generation-vi']['xy'] = temp;
        res.data['sprites']['versions']['generation-vi'].remove('x-y');
      }
      for (var e in res.data['moves']) {
        e['detail_move'] = e['move'];
        e.remove('move');
      }
      // logKey('tess', res.data);
      final _data = Pokemon.fromJson(res.data);
      // logKey('_data', _data.toJson());
      data.value = _data;
    } on dio.DioException catch (e) {
      logKey('error getDetailPokemon', e.message);
      showToast('Error ${e.message}');
    }
  }

  void initialFunction() async {
    id.value = '${Get.arguments['id']}';
    isCatched.value = Get.arguments['is_cathed'] ?? false;
    logKey('isCatched.value', isCatched.value);
    if (isCatched.value) {
      data.value = Pokemon.fromJson(Get.arguments['data']);
      isLoading.value = false;
      return;
    }
    await getDetailPokemon();
    isLoading.value = false;
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
