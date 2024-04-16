import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizesWidget extends StatefulWidget {
  const SizesWidget({
    super.key,
  });

  @override
  State<SizesWidget> createState() => _SizesWidgetState();
}

class _SizesWidgetState extends State<SizesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select sizes",
            style: appStyle(fw: FontWeight.w600, size: 20)
                .copyWith(color: Colors.black)),
        SizedBox(height: 10 * Sizeconfig.verticalBlock),
        SizedBox(
          height: 40 * Sizeconfig.verticalBlock,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: Provider.of<ProductProvider>(context, listen: false)
                .shoeSizes
                .length,
            itemBuilder: (context, index) {
              final shoeSizes =
                  Provider.of<ProductProvider>(context, listen: false)
                      .shoeSizes;
              return ChoiceChip(
                disabledColor: const Color.fromARGB(143, 158, 158, 158),
                shape: const CircleBorder(),
                backgroundColor: shoeSizes[index]["isSelected"]
                    ? Colors.black
                    : const Color.fromARGB(143, 158, 158, 158),
                label: Text("${shoeSizes[index]["size"]}",
                    style: appStyle(fw: FontWeight.w500, size: 15).copyWith(
                        color: shoeSizes[index]["isSelected"]
                            ? Colors.white
                            : Colors.black)),
                selected: shoeSizes[index]["isSelected"],
                side: BorderSide.none,
                showCheckmark: false,
                selectedColor: Colors.black,
                onSelected: (value) {
                  if (Provider.of<ProductProvider>(context, listen: false)
                      .sizes
                      .contains(shoeSizes[index]["size"])) {
                    Provider.of<ProductProvider>(context, listen: false)
                        .sizes
                        .clear();
                  } else {
                    Provider.of<ProductProvider>(context, listen: false)
                        .sizes
                        .clear();
                    Provider.of<ProductProvider>(context, listen: false)
                        .sizes
                        .add(shoeSizes[index]["size"]);
                  }
                  print(Provider.of<ProductProvider>(context, listen: false)
                      .sizes);
                  Provider.of<ProductProvider>(context, listen: false)
                      .toggleCheck(index);
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
