class Comment {
  final String readerName;
  final String readerImage;
  final String readerNickname;
  final String comment;

  Comment({
    required this.readerName,
    required this.readerImage,
    required this.readerNickname,
    required this.comment,
  });

  // Factory constructor from JSON
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      readerName: json['reader_name'],
      readerImage: json['reader_image'],
      readerNickname: json['reader_nickname'],
      comment: json['comment'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'reader_name': readerName,
      'reader_image': readerImage,
      'reader_nickname': readerNickname,
      'comment': comment,
    };
  }
}
