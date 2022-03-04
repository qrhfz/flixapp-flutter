part of 'tv_show_popular_cubit.dart';

@freezed
class TvShowPopularState with _$TvShowPopularState {
  const factory TvShowPopularState.initial() = _Initial;
  const factory TvShowPopularState.loading() = _Loading;
  const factory TvShowPopularState.data(List<TVShow> shows) = _Data;
  const factory TvShowPopularState.error(String message) = _Error;
}
