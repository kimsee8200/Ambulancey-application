import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class SubpageTemplate extends StatelessWidget {
  final String title;
  final Widget child;
  const SubpageTemplate({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 32,
                  color: gray500
                )
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: blue900,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),
                  overflow: TextOverflow.ellipsis
                )
              )
            ]
          ),
          const SizedBox(height: 20),
          child
        ]
      )
    );
  }
}
