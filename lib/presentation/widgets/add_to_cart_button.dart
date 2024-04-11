import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    this.ontap,
    required this.label,
  });
  final void Function()? ontap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 0.9 * Sizeconfig.screenWidth,
        height: 50 * Sizeconfig.verticalBlock,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22))),
            onPressed: ontap,
            child: Text(
              label,
              style: appStyle(fw: FontWeight.bold, size: 20)
                  .copyWith(color: Colors.white),
            )),
      ),
    );
  }
}
