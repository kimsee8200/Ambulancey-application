import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/star.dart';
import 'package:ambulancey/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel data;
  const ReviewItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: blue50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: gray300,
                  shape: OvalBorder()
                )
              ),
              const SizedBox(width: 5),
              Text(
                data.name,
                style: const TextStyle(
                  color: gray700,
                  fontSize: 14
                )
              ),
              Transform.scale(
                scale: 0.75,
                origin: const Offset(-40, 0),
                child: Star(star: data.star)
              )
            ]
          ),
          Text(
            data.content,
            softWrap: true,
            style: const TextStyle(
              color: gray900,
              fontSize: 14
            )
          )
        ]
      )
    );
  }
}
