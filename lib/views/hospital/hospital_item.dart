import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/chip.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/star.dart';
import 'package:ambulancey/models/hospital_model.dart';

class HospitalItem extends StatelessWidget {
  final HospitalModel data;
  final void Function(int) onTap;
  const HospitalItem({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: blue400),
          borderRadius: BorderRadius.circular(16)
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 0
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: const TextStyle(color: blue900, fontSize: 16, fontWeight: FontWeight.bold, height: 1.4)
            ),
            Text(
              data.address,
              style: const TextStyle(color: gray500, fontSize: 12, height: 1)
            ),
            Text(
              data.type,
              style: const TextStyle(color: gray500, fontSize: 12)
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Star(star: data.star),
                const SizedBox(width: 2),
                Text('${data.star}'),
                const Spacer(),
                InkWell(
                  onTap: ()=>onTap(data.id),
                  child: const FilledChip(label: '보기')
                )
              ]
            )
          ]
        )
      )
    );
  }
}