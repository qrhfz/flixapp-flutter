part of 'movie_popular_cubit.dart';

@freezed
class MoviePopularState with _$MoviePopularState {
  const factory MoviePopularState.initial() = _Initial;
  const factory MoviePopularState.loading() = _Loading;
  const factory MoviePopularState.data(List<Movie> popular) = _Data;
  const factory MoviePopularState.error(String message) = _Error;
}
