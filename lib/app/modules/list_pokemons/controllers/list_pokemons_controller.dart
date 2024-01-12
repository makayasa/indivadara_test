import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:indivara_test/app/controllers/network_controller.dart';
import 'package:indivara_test/app/routes/app_pages.dart';
import 'package:indivara_test/config/environment.dart';
import 'package:indivara_test/config/function_utils.dart';

class ListPokemonsController extends GetxController {
  final listPokemons = [].obs;
  final network = Get.find<NetworkController>();
  ScrollController scrollController = ScrollController();

  final isLoading = false.obs;

  final offsetPagination = 0.obs;

  Future<void> getPokemons() async {
    // logKey('$baseUrl/pokemon/?offset=0&limit=20');
    final url = '$baseUrl/pokemon/?offset=${offsetPagination.value}&limit=20';
    try {
      dio.Response res = await network.get(url);
      offsetPagination.value = int.parse(res.data['next'].split('?').last.split('&').first.split('=').last);
      for (var e in res.data['results']) {
        final List split = e['url'].split('/');
        final id = split[split.length - 2];
        e['id'] = id;
      }
      listPokemons.addAll(res.data['results']);
      logKey('res getPokemons', res.data);
    } on dio.DioException catch (e) {
      logKey('error getPokemons', e.message);
    }
  }

  void toDetailPokemon(int index) {
    Get.toNamed(
      Routes.DETAIL_POKEMON,
    );
  }

  void initialFunction() async {
    scrollController.addListener(() async {
      final maxOffset = scrollController.position.maxScrollExtent;
      // logKey('maxOffset', maxOffset);
      if (scrollController.offset >= maxOffset - 300 && isLoading.isFalse) {
        isLoading.value = true;
        // await Future.delayed(Duration(seconds: 2));
        await getPokemons();
        isLoading.value = false;
        logKey('pagination trigger here', maxOffset - 100);
      }
    });
    await getPokemons();
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
