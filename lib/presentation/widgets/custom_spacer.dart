import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 25 * Sizeconfig.verticalBlock);
  }
}
