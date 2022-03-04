part of 'tv_show_airing_cubit.dart';

@freezed
class TvShowAiringState with _$TvShowAiringState {
  const factory TvShowAiringState.initial() = _Initial;
  const factory TvShowAiringState.loading() = _Loading;
  const factory TvShowAiringState.data(List<TVShow> shows) = _Data;
  const factory TvShowAiringState.error(String message) = _Error;
}
