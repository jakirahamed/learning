import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/slider_provider.dart';
import '../../../widget/cached_img.dart';
import '../../../widget/shimmer.dart';

class SliderWidget extends ConsumerWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final sliderImg = ref.watch(sliderImgProvider);

    return sliderImg.when(
      data: (data) => Stack(
        children: [
          Card(
            child: CarouselSlider.builder(
              itemCount: data.length,
              options: CarouselOptions(
                height: 120,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  return ref.read(sliderpositionProvider.state).state = index;
                },
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) =>
                  SizedBox.expand(
                child: KCachedImg(
                  imageUrl: data[itemIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: DotsIndicator(
              dotsCount: data.length,
              position: ref.watch(sliderpositionProvider).toDouble(),
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => Text("Error$error"),
      loading: () => Center(
        child: KShimmer(
          child: SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
