import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivara_test/app/components/default_button.dart';
import 'package:indivara_test/app/components/default_text.dart';
import 'package:indivara_test/config/constant.dart';

import '../../config/color_constants.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.onTapSeccondButton,
    this.seccondButton = false,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;
  final Function()? onTapSeccondButton;
  final bool seccondButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.close_outlined,
                  color: kBgBlack,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Icon(
              // Icons.cancel_outlined,
              icon,
              size: 100,
            ),
            const SizedBox(height: 10),
            Center(
              child: DefText(
                title,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ).semilarge,
            ),
            const SizedBox(height: 20),
            DefaultButton(
              width: double.infinity,
              onTap: onTap ??
                  () {
                    Get.back();
                  },
              child: Center(
                child: DefText(
                  'OK',
                  color: kBgWhite,
                  fontWeight: FontWeight.bold,
                ).large,
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: seccondButton,
              child: DefaultButton(
                onTap: onTapSeccondButton,
                width: double.infinity,
                // color: Colors.transparent,
                color: kBgWhite,
                showBorder: true,
                child: Center(
                  child: DefText(
                    'Cancel',
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ).large,
                ),
              ),
            ),
            Visibility(
              visible: seccondButton,
              child: const SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}
