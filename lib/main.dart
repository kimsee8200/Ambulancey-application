import 'package:flutter/material.dart';
import 'package:ambulancey/routes/router.dart';
import 'package:ambulancey/views/common/color.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/login',
    routes: router,
    theme: ThemeData(
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: white
    ),
    debugShowCheckedModeBanner: false
  )
);