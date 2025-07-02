import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            onPageChanged: (int currentIndex, _) {
              _valueNotifier.value = currentIndex;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: AppColors.themeColors,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.only(left: 2),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: _valueNotifier.value == i
                          ? AppColors.themeColors
                          : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
