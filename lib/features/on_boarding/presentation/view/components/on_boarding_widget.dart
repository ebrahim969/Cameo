import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/on_boarding/data/model/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key, required this.model, required this.color,
  });

  final OnBoardingModel model;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24,),
            Container(
              height: MediaQuery.sizeOf(context).height * .5,
              decoration: BoxDecoration(
                  image:  DecorationImage(
                      image: AssetImage(
                        model.imagePath,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16)),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              model.title,
              style: Styles.anybody400style24,
              textAlign: TextAlign.center,
            ),
            
          ],
        ),
      ),
    );
  }
}