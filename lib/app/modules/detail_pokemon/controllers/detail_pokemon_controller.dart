import 'package:get/get.dart';
import 'package:indivara_test/app/controllers/network_controller.dart';
import 'package:indivara_test/app/data/pokemon/pokemon.dart';
import 'package:dio/dio.dart' as dio;
import 'package:indivara_test/config/environment.dart';
import 'package:indivara_test/config/function_utils.dart';

class DetailPokemonController extends GetxController {
  final network = Get.find<NetworkController>();
  final data = Pokemon().obs;
  var id = ''.obs;

  final isLoading = true.obs;

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
      logKey('tess', res.data);
      final _data = Pokemon.fromJson(res.data);
      logKey('_data', _data.toJson());
      data.value = _data;
    } on dio.DioException catch (e) {
      logKey('error getDetailPokemon', e.message);
      showToast('Error ${e.message}');
    }
  }

  void initialFunction() async {
    id.value = Get.arguments['id'];
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
