import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class Star extends StatelessWidget {
  final double star;
  const Star({super.key, required this.star});

  @override
  Widget build(BuildContext context) {
    return star % 1 == 0 ? Row(
      children: [
        ...List.generate(
          star.toInt(),
          growable: false,
          (index) => Image.asset('assets/star.png', height: 16, width: 20)
        ),
        ...List.generate(
          5 - star.toInt(),
          growable: false,
          (index) => Image.asset('assets/star.png', height: 16, width: 20, color: gray400)
        )
      ]
    ) :
    Row(
      children: [
        ...List.generate(
          star.floor(),
          growable: false,
          (index) => Image.asset('assets/star.png', height: 16, width: 20)
        ),
        Stack(
          children: [
            Image.asset('assets/star.png', height: 16, width: 20, color: gray400),
            ClipPath(
              clipper: LeftClipper(percent: star - star.floor()),
              child: Image.asset('assets/star.png', height: 16, width: 20)
            )
          ]
        ),
        ...List.generate(
          4 - star.floor(),
          growable: false,
          (index) => Image.asset('assets/star.png', height: 16, width: 20, color: gray400)
        )
      ]
    );
  }
}

class LeftClipper extends CustomClipper<Path> {
  final double percent;
  const LeftClipper({required this.percent});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo((size.width)*percent, 0)
      ..lineTo((size.width)*percent, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
