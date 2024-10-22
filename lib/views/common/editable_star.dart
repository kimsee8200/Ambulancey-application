import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class EditableStar extends StatefulWidget {
  final void Function(int) onChanged;
  const EditableStar({super.key, required this.onChanged});

  @override
  State<EditableStar> createState() => _EditableStarState();
}

class _EditableStarState extends State<EditableStar> {
  int star = 5;

  @override
  Widget build(BuildContext context) {
    widget.onChanged(star);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          star,
          growable: false,
          (index) => GestureDetector(
            onTap: ()=>setState(()=>star = index+1),
            child: Image.asset('assets/star.png', height: 20, width: 24)
          )
        ),
        ...List.generate(
          5 - star,
          growable: false,
          (index) => GestureDetector(
            onTap: ()=>setState(()=>star = star + index + 1),
            child: Image.asset('assets/star.png', height: 20, width: 24, color: gray400)
          )
        )
      ]
    );
  }
}