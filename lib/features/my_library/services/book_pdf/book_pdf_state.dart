part of 'book_pdf_cubit.dart';

@immutable
sealed class BookPdfState {}

final class BookPdfInitial extends BookPdfState {}
class BookPdfLoading extends BookPdfState {}

class BookPdfSuccess extends BookPdfState {
  final BookPdfModel bookPdf;

  BookPdfSuccess(this.bookPdf);
}

class BookPdfFailure extends BookPdfState {
  final String message;

  BookPdfFailure(this.message);
}