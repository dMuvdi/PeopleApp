class Post {
  final int id;
  final String title;
  final String content;

  Post({required this.id, required this.title, required this.content});

  // Factory constructor for creating a Post object from a JSON map
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': content,
  };
}