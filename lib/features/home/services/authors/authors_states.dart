import '../../../shared/models/author.dart';

abstract class AuthorsStates {}

class AuthorsInitial extends AuthorsStates {}

class AuthorsLoading extends AuthorsStates {}

class AuthorsSuccess extends AuthorsStates {
  final List<Author> authors;

  AuthorsSuccess(this.authors);
}

class AuthorsError extends AuthorsStates {
  final String errorMessage;

  AuthorsError(this.errorMessage);
}
