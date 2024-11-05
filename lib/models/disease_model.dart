class DiseaseModel {
  final String name;
  final String info;
  final bool visit;
  final List<String> signal;

  const DiseaseModel({required this.name, required this.info, required this.visit, required this.signal});

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      name: json['disease_res'],
      info: json['disease_info'],
      visit: json['need_hosp'],
      signal: json['disease_signal']
    );
  }
}
