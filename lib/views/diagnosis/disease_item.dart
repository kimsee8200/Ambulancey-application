import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/chip.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/models/disease_model.dart';

class DiseaseItem extends StatelessWidget {
  final DiseaseModel data;
  final void Function(DiseaseModel) onTap;
  const DiseaseItem({super.key, required this.data, required this.onTap});

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data.visit ? '병원 방문 필요' : '병원 방문 불필요'),
                  const Spacer(),
                  InkWell(
                    onTap: ()=>onTap(data),
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