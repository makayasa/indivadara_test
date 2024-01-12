import 'package:flutter/material.dart';
import 'package:indivara_test/app/components/default_text.dart';
import 'package:indivara_test/config/color_constants.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.image,
    required this.label,
    this.labelColor,
    this.onTap,
  });
  final String image;
  final String label;
  final Color? labelColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kInactiveColor2,
      child: InkWell(
        splashColor: kPrimaryColor2,
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  image,
                ),
              ),
              const SizedBox(height: 5),
              DefText(
                label,
                // 'Catch Pokemon',
                color: labelColor ?? kInactiveColor,
              ).semilarge,
            ],
          ),
        ),
      ),
    );
  }
}
