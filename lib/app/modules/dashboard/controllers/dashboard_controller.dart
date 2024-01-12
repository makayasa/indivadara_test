import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final pageController = PageController();
  final pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    // pageController.addListener(() {});
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
