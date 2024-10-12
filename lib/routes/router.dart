import 'package:ambulancey/views/widget_test.dart';
import 'package:ambulancey/views/user/login.dart';
import 'package:ambulancey/views/user/signup.dart';

final router = {
  '/test': (context) => const WidgetTest(),
  '/login': (context) => const Login(),
  '/signup': (context) => const Signup()
};