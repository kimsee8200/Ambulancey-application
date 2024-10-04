class HospitalModel {
  final int id;
  final String name;
  final String type;
  final String description;
  final String openTime;
  final bool isOpen;
  final String address;

  const HospitalModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.openTime,
    required this.isOpen,
    required this.address
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['hospital_id'],
      name: json['manage_id'],
      type: json['type'],
      description: json['description'],
      openTime: json['open_time'],
      isOpen: json['is_open'],
      address: json['address']
    );
  }
}