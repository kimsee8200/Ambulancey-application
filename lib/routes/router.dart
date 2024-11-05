import 'package:ambulancey/views/widget_test.dart';
import 'package:ambulancey/views/user/login.dart';
import 'package:ambulancey/views/user/signup.dart';
import 'package:ambulancey/views/user/edit.dart';
import 'package:ambulancey/views/home/root.dart';
import 'package:ambulancey/views/diagnosis/diagnosis_do.dart';
import 'package:ambulancey/views/diagnosis/diagnosis_result_all.dart';
import 'package:ambulancey/views/diagnosis/disease_all.dart';
import 'package:ambulancey/views/hospital/hospital_detail.dart';
import 'package:flutter/cupertino.dart';

final router = {
  '/test': (context) => const WidgetTest(),
  '/': (context) => const Root(),
  '/login': (context) => const Login(),
  '/signup': (context) => const Signup(),
  '/edit': (context) => const Edit(),
  '/diagnosis': (context) => const DiagnosisDo(),
  '/diagnosis/results': (context) => const DiagnosisResultAll(),
  '/diseases': (context) => DiseaseAll(),
  '/hospital/:id': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return HospitalDetail(id: args['id'] as int);
  },
};