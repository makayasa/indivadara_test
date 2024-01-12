import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indivara_test/config/color_constants.dart';
import 'package:indivara_test/config/initial_bindings.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

void main() {
  initializeDateFormatting();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: kPrimaryTheme,
    initialBinding: InitialBindings(),
    ),
  );
}
