import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key, this.onPressed, required this.label, required this.btnColor});
  final void Function()? onPressed;
  final String label;
  final Color btnColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45 * Sizeconfig.verticalBlock,
        width: Sizeconfig.designWidth * 0.27,
        decoration: BoxDecoration(
          border:
              Border.all(color: btnColor, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: appStyle(fw: FontWeight.w600, size: 16)
                .copyWith(color: btnColor),
          ),
        ),
      ),
    );
  }
}
