part of 'watchlist_cubit.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = _Initial;
  const factory WatchlistState.loading() = _Loading;
  const factory WatchlistState.data(List<Movie> movies) = _Data;
  const factory WatchlistState.error(String message) = _Error;
}
