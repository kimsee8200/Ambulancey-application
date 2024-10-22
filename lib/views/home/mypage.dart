import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/button.dart';
import 'package:ambulancey/views/common/chip.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 15),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: gray200,
                child: Icon(Icons.person, size: 40, color: Colors.white)
              ),
              SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'hk2008',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 0.8
                    )
                  ),
                  Text(
                    '현위치: 대전광역시 동구',
                    style: TextStyle(fontSize: 16, color: gray500)
                  )
                ]
              )
            ]
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){},
              splashColor: gray50,
              child: const Text(
                '회원정보 수정',
                style: TextStyle(
                  color: gray500,
                  fontSize: 16
                )
              )
            )
          ),
          const SizedBox(height: 10),
          Container(width: double.infinity, height: 2, color: gray400),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){},
                  child: const FilledChip(
                    label: '회원정보 수정'
                  )
                ),
                InkWell(
                  onTap: (){},
                  splashColor: criticalBackground,
                  child: const Text(
                    '회원탈퇴',
                    style: TextStyle(
                      color: criticalMain,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}
