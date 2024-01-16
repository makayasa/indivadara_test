import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:indivara_test/app/controllers/network_controller.dart';
import 'package:indivara_test/app/data/sample/sample.dart';
import 'package:indivara_test/app/data/sample/user.dart';
import 'package:indivara_test/config/function_utils.dart';

class SampleController extends GetxController {
  final network = Get.find<NetworkController>();
  // final data = Sample().obs;
  final listUsers = <User>[].obs;

  Future<void> sampleApi() async {
    try {
      dio.Response res = await network.get(
        'https://api.slingacademy.com/v1/sample-data/users',
      );
      // logKey('res sampleApi', res);
      // final User user = User.fromJson(res.data['users']);
      for (var user in res.data['users']) {
        final _user = User.fromJson(user);
        listUsers.add(_user);
      }
      // logKey('listData first', listUsers.first.id);

      // data.value = Sample.fromJson(res.data);
    } on dio.DioException catch (e) {
      logKey('error sampleApi', e.message);
    }
  }

  void initialFunction() async {
    await sampleApi();
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
