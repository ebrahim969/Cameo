import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/data/model/slider_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/slider_button.dart';
import 'package:tigor_store/features/home/presentation/view/components/slider_indecator.dart';
import 'package:tigor_store/features/home/presentation/view/components/slider_widget.dart';

class CustomHomeSlider extends StatefulWidget {
  const CustomHomeSlider({
    super.key,
  });

  @override
  State<CustomHomeSlider> createState() => _CustomHomeSliderState();
}

class _CustomHomeSliderState extends State<CustomHomeSlider> {
  int activeIndex = 0;
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: sliderImages.length,
              itemBuilder: (context, index, realIndex) {
                return sliderWidget(index);
              },
              options: CarouselOptions(
                height: 200,
                // autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            Positioned(
                right: 5,
                child: SliderButton(
                  onPressed: () {
                    next();
                  },
                  icon: Icons.arrow_forward_ios,
                )),
            Positioned(
                left: 5,
                child: SliderButton(
                  onPressed: () {
                    previous();
                  },
                  icon: Icons.arrow_back_ios,
                )),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        sliderIndecator(activeIndex),
      ],
    );
  }

  void next() {
    controller.nextPage(duration: const Duration(milliseconds: 500));
  }

  void previous() {
    controller.previousPage(duration: const Duration(milliseconds: 500));
  }
}
