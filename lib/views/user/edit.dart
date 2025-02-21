import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/default_view.dart';
import 'package:ambulancey/views/common/logo.dart';
import 'package:ambulancey/views/common/input.dart';
import 'package:ambulancey/views/common/button.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String id = "";
  String password = "";
  String newPassword = "";

  @override
  Widget build(BuildContext context) {
    return DefaultView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Logo.withText("회원정보 수정"),
            const SizedBox(height: 40),
            TextInput(
              placeholder: "새 아이디를 입력해주세요.",
              onChanged: (value)=>setState(() {
                id = value;
              })
            ),
            const SizedBox(height: 14),
            PasswordInput(
              placeholder: "이전 비밀번호를 입력해주세요.",
              onChanged: (value)=>setState(() {
                password = value;
              })
            ),
            const SizedBox(height: 14),
            PasswordInput(
              placeholder: "새 비밀번호를 입력해주세요.",
              onChanged: (value)=>setState(() {
                newPassword = value;
              })
            ),
            const SizedBox(height: 32),
            LargeButton(
              text: "회원 정보 수정 완료",
              enabled: id.isNotEmpty && password.isNotEmpty && newPassword.isNotEmpty,
              onPressed: ()=>Navigator.pop(context)
            )
          ]
        )
    );
  }
}
