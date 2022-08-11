import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../product/all_product.dart';
import '../../product/product_tile.dart';

class AllProduct extends ConsumerWidget {
  const AllProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(showProductProvider);

    return products.when(
      data: (productlist) => StaggeredGrid.count(
        crossAxisCount: 2,
        children: [
          ...List.generate(
            productlist.length,
            (index) => ProductTile(product: productlist[index]),
          ).toList()
        ],
      ),
      error: (error, stackTrace) => Text("Error$error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
