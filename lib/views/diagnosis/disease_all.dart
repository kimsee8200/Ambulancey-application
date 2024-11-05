import 'package:ambulancey/models/disease_model.dart';
import 'package:ambulancey/views/diagnosis/disease_item.dart';
import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/sub_page_template.dart';

class DiseaseAll extends StatelessWidget {
  DiseaseAll({super.key});
  final dummy = <DiseaseModel>[
    const DiseaseModel(name: '정신병', info: '나가죽어', visit: false, signal: ['엄준식']),
    const DiseaseModel(name: '정신병', info: '나가죽어', visit: false, signal: ['엄준식'])
  ];

  @override
  Widget build(BuildContext context) {
    return SubpageTemplate(
      title: '질병목록',
      child: Expanded(
        child: ListView.separated(
          itemCount: dummy.length,
          itemBuilder: (_, i) => DiseaseItem(
              data: dummy[i],
              onTap: (_){}
          ),
          separatorBuilder: (_, i)=>const SizedBox(height: 25)
        )
      )
    );
  }
}
