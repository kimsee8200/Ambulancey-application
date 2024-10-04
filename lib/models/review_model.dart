class ReviewModel {
  final int id;
  final int userId;
  final String content;
  final double star;

  const ReviewModel({required this.id, required this.userId, required this.content, required this.star});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['review_id'],
      userId: json['user_id'],
      content: json['content'],
      star: json['star']
    );
  }
}