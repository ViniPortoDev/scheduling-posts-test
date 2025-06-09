class Post {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final DateTime scheduledDate;

  Post({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.scheduledDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'scheduledDate': scheduledDate.toIso8601String(),
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'] ?? 'https://static.todamateria.com.br/upload/pa/is/paisagem-natural-og.jpg?class=ogImageSquare',
      description: json['description'],
      scheduledDate: DateTime.parse(json['scheduledDate']),
    );
  }
}
