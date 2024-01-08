import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/data/model/slider_model.dart';

Container sliderWidget(int index) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(sliderImages[index].imagePath),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter)),
  );
}
