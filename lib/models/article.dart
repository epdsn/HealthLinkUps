class Article {
  final String id;
  final String title;
  final String content;
  final String author;
  final DateTime publishedDate;
  final String imageUrl;
  final String category;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.publishedDate,
    required this.imageUrl,
    required this.category,
  });

  Article copyWith({
    String? id,
    String? title,
    String? content,
    String? author,
    DateTime? publishedDate,
    String? imageUrl,
    String? category,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author,
      publishedDate: publishedDate ?? this.publishedDate,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }
}
