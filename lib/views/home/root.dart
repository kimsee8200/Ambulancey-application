import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/bottom_navigation.dart';
import 'package:ambulancey/views/common/header.dart';
import 'package:ambulancey/views/home/home.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _current = 0;
  final List<Widget> _pages = [
    const Home(),
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
    return SafeArea(
      child: Scaffold(
        appBar: Header(title: _titles[_current]),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: IndexedStack(
            index: _current,
            children: _pages
          )
        ),
        bottomNavigationBar: BottomNavigation(
          selectedIndex: _current,
          onItemTapped: (i)=>setState(()=>_current = i)
        )
      )
    );
  }
}