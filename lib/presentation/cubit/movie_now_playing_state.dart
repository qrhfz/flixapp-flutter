part of 'movie_now_playing_cubit.dart';

@freezed
class MovieNowPlayingState with _$MovieNowPlayingState {
  const factory MovieNowPlayingState.initial() = _Initial;
  const factory MovieNowPlayingState.loading() = _Loading;
  const factory MovieNowPlayingState.data(List<Movie> nowPlaying) = _Data;
  const factory MovieNowPlayingState.error(String message) = _Error;
}
