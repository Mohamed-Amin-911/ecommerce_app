import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/widgets/staggered_tile.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class StaggeredGridViewDisplayWidget extends StatelessWidget {
  const StaggeredGridViewDisplayWidget({
    super.key,
    required this.list,
  });

  final Future<List<SneakerClass>> list;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final shoes = snapshot.data!;
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
              scrollDirection: Axis.vertical,
              itemCount: shoes.length,
              itemBuilder: (context, index) {
                final shoes = snapshot.data![index];
                return StagggeredTile(sneaker: shoes);
              },
              staggeredTileBuilder: (index) => StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3)
                      ? Sizeconfig.designHeight * 0.35
                      : Sizeconfig.designHeight * 0.4),
            );
          }
        });
  }
}
