import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/default_view.dart';
import 'package:ambulancey/views/common/logo.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/input.dart';
import 'package:ambulancey/views/common/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String id = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Logo.withText("로그인 하기"),
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
          const SizedBox(height: 32),
          PrimaryButton(
            text: "로그인",
            enabled: id.isNotEmpty && password.isNotEmpty,
            onPressed: (){}
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "아직 계정이 없으신가요?",
                style: TextStyle(
                  fontSize: 11,
                  color: gray400
                )
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: ()=>Navigator.pushReplacementNamed(context, '/signup'),
                child: const Text(
                  "회원가입",
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
