import 'package:ambulancey/views/user/login.dart';
import 'package:ambulancey/views/user/signup.dart';
import 'package:ambulancey/views/user/survey.dart';

final router = {
  '/login': (context) => const Login(),
  '/signup': (context) => const Signup(),
  '/survey': (context) => const Survey()
};