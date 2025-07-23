part of 'country_book_count_cubit.dart';

@immutable
sealed class CountryBookCountState {}

final class CountryBookCountInitial extends CountryBookCountState {}

final class CountryBookCountLoading extends CountryBookCountState {}

final class CountryBookCountSuccess extends CountryBookCountState {
  final List<CountryBookCountModel> country;

  CountryBookCountSuccess(this.country);
}

final class CountryBookCountFailure extends CountryBookCountState {
  final String message;

  CountryBookCountFailure(this.message);
}
