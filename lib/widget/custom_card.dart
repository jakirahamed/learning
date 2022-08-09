import 'package:flutter/material.dart';
import 'package:learning/widget/shimmer.dart';

class custom_product_card extends StatelessWidget {
  const custom_product_card({
    Key? key,
    required this.title,
    required this.teachername,
    required this.reting,
    required this.price,
  }) : super(key: key);
  final String title;
  final String teachername;
  final String reting;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KShimmer(
            child: SizedBox(
              height: 120,
              width: 200,
              child: Card(),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(teachername),
          Text(reting),
          Text(price),
        ],
      ),
    );
  }
}
