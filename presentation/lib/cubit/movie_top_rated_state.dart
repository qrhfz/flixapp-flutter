part of 'movie_top_rated_cubit.dart';

@freezed
class MovieTopRatedState with _$MovieTopRatedState {
  const factory MovieTopRatedState.initial() = _Initial;
  const factory MovieTopRatedState.loading() = _Loading;
  const factory MovieTopRatedState.data(List<Movie> topRated) = _Data;
  const factory MovieTopRatedState.error(String message) = _Error;
}
