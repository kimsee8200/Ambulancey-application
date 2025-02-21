import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ambulancey/routes/router.dart';
import 'package:ambulancey/views/common/color.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: kDebugMode ? '/test' : '/login',
    routes: router,
    theme: ThemeData(
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: white
    ),
    debugShowCheckedModeBanner: false
  )
);