class HospitalDetailModel {
  final int id;
  final String name;
  final String type;
  final String description;
  final String openTime;
  final bool isOpen;
  final String phone;
  final List<int> reviews;

  const HospitalDetailModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.openTime,
    required this.isOpen,
    required this.phone,
    required this.reviews
  });

  factory HospitalDetailModel.fromJson(Map<String, dynamic> json) {
    return HospitalDetailModel(
      id: json['hospital_id'],
      name: json['hospital_name'],
      type: json['type'],
      description: json['description'],
      openTime: json['open_time'],
      isOpen: json['is_open'],
      phone: json['phone'],
      reviews: json['reviews']
    );
  }
}