class CommunityPost {
  final String id;
  final String author;
  final String content;
  final DateTime timestamp;
  final int likes;
  final String? linkUrl;

  CommunityPost({
    required this.id,
    required this.author,
    required this.content,
    required this.timestamp,
    required this.likes,
    this.linkUrl,
  });

  CommunityPost copyWith({
    String? id,
    String? author,
    String? content,
    DateTime? timestamp,
    int? likes,
    String? linkUrl,
  }) {
    return CommunityPost(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      likes: likes ?? this.likes,
      linkUrl: linkUrl ?? this.linkUrl,
    );
  }
}
