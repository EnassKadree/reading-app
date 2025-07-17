class BookPdfModel {
  final String pdfUrl;

  BookPdfModel({
    required this.pdfUrl,
  });

  factory BookPdfModel.fromJson(Map<String, dynamic> json, int bookId) {
    return BookPdfModel(
      pdfUrl: json['pdf_url'],
    );
  }
}
