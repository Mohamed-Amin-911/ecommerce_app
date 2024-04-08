import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:flutter/material.dart';

class BottomNavItemWidget extends StatelessWidget {
  const BottomNavItemWidget({
    super.key,
    required this.icon,
    required this.function,
  });
  final IconData icon;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        height: 36 * Sizeconfig.verticalBlock,
        width: 36 * Sizeconfig.horizontalBlock,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
