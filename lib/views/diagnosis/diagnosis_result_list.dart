import 'package:flutter/material.dart';
import 'package:ambulancey/models/diagnosis_result_model.dart';
import 'package:ambulancey/views/diagnosis/diagnosis_result_item.dart';

class DiagnosisResultList extends StatelessWidget {
  final List<DiagnosisResultModel> data;
  final void Function(DiagnosisResultModel) onTap;
  const DiagnosisResultList({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        data.length*2,
          (int i)=>(i%2 == 0) ? DiagnosisResultItem(
          data: data[(i~/2)],
          onTap: (DiagnosisResultModel data)=>onTap(data)
       ) : const SizedBox(height: 25)
      )
    );
  }
}
