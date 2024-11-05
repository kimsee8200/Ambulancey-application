class DiagnosisResultModel {
  final String response;
  final String info;
  final bool visit;

  const DiagnosisResultModel({required this.response, required this.info, required this.visit});

  factory DiagnosisResultModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisResultModel(
      response: json['disease_res'],
      info: json['disease_info'],
      visit: json['visit_hosp']
    );
  }
}
