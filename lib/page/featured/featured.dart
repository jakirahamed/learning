import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/page/cart/cart.dart';
import 'package:learning/page/featured/drower.dart';
import 'package:learning/page/featured/local/categories_chip.dart';
import 'package:learning/page/featured/local/featured_product.dart';
import 'package:learning/page/featured/local/top_product.dart';
import 'local/all_product.dart';
import 'local/slider.dart';

class FeaturedPage extends ConsumerWidget {
  const FeaturedPage({Key? key}) : super(key: key);
  static const String routeName = '/featuredpage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.routeName);
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      drawer: const DrowerF(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SliderWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "Featured",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FeaturedProduct(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See all'),
                    ),
                  ],
                ),
              ),
              const categories_chip(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Top courses',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TopProduct(),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'All Courses',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 10),
              const AllProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
