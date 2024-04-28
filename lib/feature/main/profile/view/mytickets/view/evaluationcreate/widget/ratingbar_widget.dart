import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';

class EvaluationRatingBarWidget extends StatelessWidget {
  const EvaluationRatingBarWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.modelService,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final ProfileModelService modelService;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      child: Container(
        alignment: Alignment.center,
        child: RatingBar.builder(
          wrapAlignment: WrapAlignment.center,
          initialRating: modelService.ratingPointValue,
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return const SizedBox();
            }
          },
          onRatingUpdate: (rating) {
            modelService.ratingPointValue = rating;
          },
        ),
      ),
    );
  }
}
