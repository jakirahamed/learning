import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../product/all_product.dart';
import '../../product/product_tile.dart';

class TopProduct extends ConsumerWidget {
  const TopProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(showProductProvider);

    return products.when(
      data: (productlist) => Row(
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
