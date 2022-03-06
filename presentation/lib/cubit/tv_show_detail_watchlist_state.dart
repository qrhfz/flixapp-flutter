part of 'tv_show_detail_watchlist_cubit.dart';

@freezed
class TvShowDetailWatchlistState with _$TvShowDetailWatchlistState {
  const factory TvShowDetailWatchlistState.data(bool isInWatchlist) = _Data;
  const factory TvShowDetailWatchlistState.success(String message) = _Success;
  const factory TvShowDetailWatchlistState.error(String message) = _Error;
}
