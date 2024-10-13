import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 8,
            offset: Offset(0, -4)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: BottomNavigationBar(
          backgroundColor: white,
          selectedLabelStyle: const TextStyle(
            fontSize: 13
          ),
          selectedItemColor: blue400,
          unselectedItemColor: blue400,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/home_icon.png',
                width: 24,
                height: 24
              ),
              label: '홈'
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/me_icon.png',
                width: 24,
                height: 24
              ),
              label: '마이페이지'
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/self_diagnosis.png',
                width: 24,
                height: 24
              ),
              label: '자가진단'
            )
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped
        )
      )
    );
  }
}
