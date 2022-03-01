part of 'movie_detail_recommendations_cubit.dart';

@freezed
class MovieDetailRecommendationsState with _$MovieDetailRecommendationsState {
  const factory MovieDetailRecommendationsState.initial() = _Initial;
  const factory MovieDetailRecommendationsState.loading() = _Loading;
  const factory MovieDetailRecommendationsState.data(
      List<Movie> reommendations) = _Data;
  const factory MovieDetailRecommendationsState.error(String message) = _Error;
}
