import 'package:flutter/material.dart';
import 'package:ambulancey/models/hospital_model.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/chip.dart';
import 'package:ambulancey/views/hospital/hospital_item.dart';

class HospitalList extends StatelessWidget {
  final List<HospitalModel> data;
  final void Function(int) onTap;
  const HospitalList({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            FilledChip(label: '대전(현 지역)'),
            SizedBox(width: 10),
            FilledChip(label: '추천: 정신과')
          ]
        ),
        const SizedBox(height: 10),
        const Text(
          '홈에서 추천하는 병원은 회원님의 현 지역 정보와 최근자가진단 결과를 바탕으로 만들어졌습니다.',
          style: TextStyle(
            color: gray500,
            fontSize: 11
          )
        ),
        const SizedBox(height: 19),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '${data.length}건   ',
            style: const TextStyle(
              color: gray900,
              fontSize: 14
            )
          )
        ),
        const SizedBox(height: 14),
        ...List.generate(
          data.length,
          (int i)=>HospitalItem(
            data: data[i],
            onTap: (int id)=>onTap(id)
          )
        )
      ]
    );
  }
}
