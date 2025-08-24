part of 'library_stats_cubit.dart';


abstract  class LibraryStatsState {}

final class LibraryStatsInitial extends LibraryStatsState {}

class LibraryStatsLoading extends LibraryStatsState {}

class LibraryStatsSuccess extends LibraryStatsState {
  final LibraryStats stats;
  LibraryStatsSuccess(this.stats);
}

class LibraryStatsFailure extends LibraryStatsState {
  final String message;
  LibraryStatsFailure(this.message);
}
