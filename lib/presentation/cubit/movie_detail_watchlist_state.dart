part of 'movie_detail_watchlist_cubit.dart';

@freezed
class MovieDetailWatchlistState with _$MovieDetailWatchlistState {
  const factory MovieDetailWatchlistState.success(String message) = _Success;
  const factory MovieDetailWatchlistState.data(bool isInWatchlist) = _Data;
  const factory MovieDetailWatchlistState.error(String message) = _Error;
}
