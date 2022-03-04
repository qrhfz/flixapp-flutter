part of 'tv_show_top_rated_cubit.dart';

@freezed
class TvShowTopRatedState with _$TvShowTopRatedState {
  const factory TvShowTopRatedState.initial() = _Initial;
  const factory TvShowTopRatedState.loading() = _Loading;
  const factory TvShowTopRatedState.data(List<TVShow> shows) = _Data;
  const factory TvShowTopRatedState.error(String message) = _Error;
}
