import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/sub_page_template.dart';
import 'package:ambulancey/views/diagnosis/diagnosis_result_item.dart';
import 'package:ambulancey/views/common/color.dart';

import '../../models/diagnosis_result_model.dart';

class DiagnosisResultAll extends StatefulWidget {
  const DiagnosisResultAll({super.key});

  @override
  State<DiagnosisResultAll> createState() => _DiagnosisResultAllState();
}

class _DiagnosisResultAllState extends State<DiagnosisResultAll> {
  final dummy = [
    const DiagnosisResultModel(
        response: "test",
        info: "info",
        visit: false
    ),
    const DiagnosisResultModel(
        response: "test",
        info: "info",
        visit: true
    ),
    const DiagnosisResultModel(
        response: "test",
        info: "info",
        visit: true
    ),
    const DiagnosisResultModel(
        response: "test",
        info: "info",
        visit: true
    ),
    const DiagnosisResultModel(
        response: "test",
        info: "info",
        visit: true
    ),
    const DiagnosisResultModel(
        response: "test",
        info: "info",
        visit: true
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubpageTemplate(
        title: "검사한 자가진단",
        child: Expanded(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '자가진단 ${dummy.length}건   ',
                  style: const TextStyle(
                    color: gray400,
                    fontSize: 14
                  )
                )
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: dummy.length,
                  itemBuilder: (_, i) => DiagnosisResultItem(
                    data: dummy[i],
                    onTap: (_){}
                  ),
                  separatorBuilder: (_, i)=>const SizedBox(height: 25)
                )
              )
            ]
          )
        )
      )
    );
  }
}
