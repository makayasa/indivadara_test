import 'package:flutter/material.dart';

import '../../config/color_constants.dart';
import '../../config/constant.dart';
import 'default_text.dart';

class DefaultChip extends StatelessWidget {
  const DefaultChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: kDefaultBorderRadius10,
      ),
      child: Center(
        child: DefText(
          label,
          maxLine: 1,
          color: kWhiteMilk,
        ).normal,
      ),
    );
  }
}
