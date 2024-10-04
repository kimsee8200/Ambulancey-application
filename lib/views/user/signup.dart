import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/default_view.dart';
import 'package:ambulancey/views/common/logo.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/input.dart';
import 'package:ambulancey/views/common/button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String id = "";
  String password = "";
  String passwordRe = "";

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Logo.withText("회원가입 하기"),
          const SizedBox(height: 40),
          TextInput(
            placeholder: "아이디를 입력해주세요.",
            onChanged: (value)=>setState(() {
              id = value;
            })
          ),
          const SizedBox(height: 14),
          PasswordInput(
            placeholder: "비밀번호를 입력해주세요.",
            onChanged: (value)=>setState(() {
              password = value;
            })
          ),
          const SizedBox(height: 14),
          PasswordInput(
            placeholder: "비밀번호를 다시 입력해주세요.",
            onChanged: (value)=>setState(() {
              passwordRe = value;
            })
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: "다음으로",
            enabled: id.isNotEmpty && password.isNotEmpty && passwordRe.isNotEmpty,
            onPressed: ()=>Navigator.pushReplacementNamed(context, '/survey')
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
