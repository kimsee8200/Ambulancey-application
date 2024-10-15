import 'package:ambulancey/views/hospital/hospital_list.dart';
import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/bottom_navigation.dart';
import 'package:ambulancey/views/common/header.dart';
import 'package:ambulancey/models/hospital_model.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _current = 0;
  final List<Widget> _pages = [
    HospitalList(
      data: const [
        HospitalModel(
          id: 1,
          name: '동대전정신병원',
          type: '정신과',
          description: 'desc',
          openTime: '12',
          isOpen: false,
          address: 'asdf',
          star: 4.5
        )
      ],
      onTap: (_){}
    ),
    const Text("2"),
    const Text("3")
  ];
  final List<String> _titles = [
    '홈',
    '마이페이지',
    '자가진단'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: _titles[_current]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: IndexedStack(
          index: _current,
          children: _pages
        )
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _current,
        onItemTapped: (i)=>setState(() {
          _current = i;
        })
      )
    );
  }
}