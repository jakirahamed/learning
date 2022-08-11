import 'package:flutter/material.dart';
import 'package:learning/page/product/product_model.dart';

import '../../widget/cached_img.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: KCachedImg(
                imageUrl: product.img,
                fit: BoxFit.cover,
                height: 100,
                width: MediaQuery.of(context).size.width / 2.4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              product.authername,
            ),
            Text(
              product.price.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
