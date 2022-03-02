part of 'movie_list_cubit.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.loading() = _Loading;
  const factory MovieListState.data({
    required List<Movie> topRated,
    required List<Movie> nowPlaying,
    required List<Movie> popular,
  }) = _Data;
  const factory MovieListState.error(String message) = _Error;
}
