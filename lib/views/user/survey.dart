import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/default_view.dart';
import 'package:ambulancey/views/common/logo.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/dropdown.dart';
import 'package:ambulancey/views/common/button.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  String? local;
  String? territory;
  String? subject;

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      onBack: ()=>Navigator.pushReplacementNamed(context, '/signup'),
      child: Column(
        children: [
          Logo.withText("회원가입 전 설문조사"),
          const SizedBox(height: 40),
          TextDropdown(
            items: const ['서울특별시', '인천광역시'],
            placeholder: '사는 지역',
            onChanged: (value)=>setState(() {
              local = value;
            })
          ),
          const SizedBox(height: 14),
          TextDropdown(
            items: const ['동구', '중구'],
            placeholder: '사는 관할 구역',
            onChanged: (value)=>setState(() {
              territory = value;
            })
          ),
          const SizedBox(height: 14),
          TextDropdown(
            items: const ['신경과', '정신과'],
            placeholder: '주로 찾고 싶은 진료 과목 ',
            onChanged: (value)=>setState(() {
              subject = value;
            })
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: "회원가입",
            enabled: local != null && territory != null && subject != null,
            onPressed: (){}
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "계정이 있나요?",
                style: TextStyle(
                  fontSize: 11,
                  color: gray400
                )
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: ()=>Navigator.pushReplacementNamed(context, '/login'),
                child: const Text(
                  "로그인",
                  style: TextStyle(
                    fontSize: 11,
                    color: blue200
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}
