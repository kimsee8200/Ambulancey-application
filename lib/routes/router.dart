import 'package:ambulancey/views/widget_test.dart';
import 'package:ambulancey/views/user/login.dart';
import 'package:ambulancey/views/user/signup.dart';
import 'package:ambulancey/views/home/root.dart';

final router = {
  '/test': (context) => const WidgetTest(),
  '/': (context) => const Root(),
  '/login': (context) => const Login(),
  '/signup': (context) => const Signup()
};