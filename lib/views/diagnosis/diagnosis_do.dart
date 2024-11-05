import 'package:ambulancey/views/common/dialog.dart';
import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/sub_page_template.dart';
import 'package:ambulancey/views/common/input.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/button.dart';

class DiagnosisDo extends StatefulWidget {
  const DiagnosisDo({super.key});

  @override
  State<DiagnosisDo> createState() => _DiagnosisDoState();
}

class _DiagnosisDoState extends State<DiagnosisDo> {
  List<String> symptoms = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubpageTemplate(
        title: '자가진단 검사',
        child: Column(
          children: [
            ...List.generate(
              symptoms.length*2,
              (index) => index % 2 == 0 ? TextInput(
                onChanged: (value)=>setState(() {
                  symptoms[index ~/ 2] = value;
                  if (symptoms.last.isNotEmpty && symptoms.length < 4) {
                    symptoms.add('');
                  }
                }),
                placeholder: '증상을 입력해주세요'
              ) : const SizedBox(height: 8)
            ),
            const SizedBox(height: 10),
            Container(width: double.infinity, height: 2, color: gray400),
            const SizedBox(height: 10),
            LargeButton(
              text: '자가진단 검사 완료',
              onPressed: ()=>showDialog(
                context: context,
                builder: (context) => ModalDialog(
                  title: '알림',
                  onAccept: (){},
                  child: const Text(
                    '이대로 완료하시겠습니까?',
                    style: TextStyle(
                      color: gray600,
                      fontSize: 20
                    )
                  ),
                  onReject: (){}
                )
              ),
              enabled: symptoms.first.isNotEmpty
            )
          ]
        )
      )
    );
  }
}
