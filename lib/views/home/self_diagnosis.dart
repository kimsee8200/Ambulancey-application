import 'package:ambulancey/models/diagnosis_result_model.dart';
import 'package:ambulancey/views/common/button.dart';
import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/diagnosis/diagnosis_result_list.dart';

class SelfDiagnosis extends StatefulWidget {
  const SelfDiagnosis({super.key});

  @override
  State<SelfDiagnosis> createState() => _SelfDiagnosisState();
}

class _SelfDiagnosisState extends State<SelfDiagnosis> {
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/diseases'),
                child: const Text(
                  '질병목록 보기',
                  style: TextStyle(
                    color: gray500,
                    fontSize: 16
                  )
                ),
              ),
              Text(
                '최근 자가진단 ${dummy.length}건',
                style: const TextStyle(
                  color: gray500,
                  fontSize: 16
                )
              )
            ]
          ),
          const SizedBox(height: 25),
          Flexible(
            child: SingleChildScrollView(
              child: DiagnosisResultList(
                data: dummy,
                onTap: (_){}
              )
            )
          ),
          const SizedBox(height: 10),
          Container(width: double.infinity, height: 2, color: gray400),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/diagnosis/results'),
            splashColor: gray50,
            child: Text(
              '자가진단 결과 ${dummy.length}건 더보기',
              style: const TextStyle(
                color: gray400,
                fontSize: 16
              )
            )
          ),
          const SizedBox(height: 10),
          LargeButton(
            text: '자가진단 검사하기',
            onPressed: () => Navigator.pushNamed(context, '/diagnosis')
          ),
          const SizedBox(height: 20)
        ]
      )
    );
  }
}
