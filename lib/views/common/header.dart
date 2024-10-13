import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 8,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: AppBar(
        backgroundColor: white,
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 27),
            Image.asset(
              'assets/logo.png',
              width: 148,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: gray500,
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
