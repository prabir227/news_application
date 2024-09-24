
class Article {
  final String title;
  final String author;
  final String description;
  final String? urlToImage;
  final String content;

  Article({
    required this.title,
    required this.author,
    required this.description,
    this.urlToImage,
    required this.content,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "No Title",
      author: json['author'] ?? "Unknown",
      description: json['description'] ?? "No Description",
      urlToImage: json['urlToImage'],
      content: json['content'] ?? "No Content",
    );
  }
}
