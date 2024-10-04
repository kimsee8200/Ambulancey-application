import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class Logo extends StatelessWidget {
  final String? text = null;
  const Logo({super.key});

  static withText(String text) {
    return Column(
      children: [
        const Logo(),
        Text(text, style: const TextStyle(color: gray400, fontSize: 12))
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      width: 200,
      height: 64
    );
  }
}
