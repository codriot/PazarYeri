class CommentModel {
  CommentModel({
    required this.star,
    required this.date,
    required this.name,
    required this.comment,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      star: json['star'] as int,
      date: json['date'] as String,
      name: json['name'] as String,
      comment: json['comment'] as String,
    );
  }
  final int? star;
  final String? date;
  final String? name;
  final String? comment;

  Map<String, dynamic> toJson() {
    return {
      'star': star,
      'date': date,
      'name': name,
      'comment': comment,
    };
  }
}
