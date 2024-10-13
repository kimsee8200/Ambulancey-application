import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class FilledChip extends StatelessWidget {
  final String label;
  const FilledChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      decoration: ShapeDecoration(
        color: blue400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: white,
          fontSize: 12
        )
      )
    );
  }
}
