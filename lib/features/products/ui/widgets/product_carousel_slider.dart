import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';

class ProductCarouselSlider extends StatefulWidget {
  const ProductCarouselSlider({super.key, required this.images});
  final List<String> images;

  @override
  State<ProductCarouselSlider> createState() => _ProductCarouselSliderState();
}

class _ProductCarouselSliderState extends State<ProductCarouselSlider> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240.0,
            viewportFraction: 1,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 2),
            onPageChanged: (int currentIndex, _) {
              _valueNotifier.value = currentIndex;
            },
          ),
          items: widget.images.map((singleImage) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(image: NetworkImage(singleImage)),
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: ValueListenableBuilder(
            valueListenable: _valueNotifier,
            builder: (context, index, _) {
              return Row(
                spacing: 0.2,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.images.length; i++)
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(left: 2),

                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey.shade400, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: _valueNotifier.value == i
                            ? AppColors.themeColors
                            : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
