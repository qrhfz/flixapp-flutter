part of 'tv_watchlist_cubit.dart';

@freezed
class TvWatchlistState with _$TvWatchlistState {
  const factory TvWatchlistState.initial() = _Initial;
  const factory TvWatchlistState.loading() = _Loading;
  const factory TvWatchlistState.data(List<TVShow> shows) = _Data;
  const factory TvWatchlistState.error(String message) = _Error;
}
