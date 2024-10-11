class ReviewModel {
  final int id;
  final String name;
  final String content;
  final double star;

  const ReviewModel({required this.id, required this.name, required this.content, required this.star});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['review_id'],
      name: json['user_name'],
      content: json['content'],
      star: json['star']
    );
  }
}