part of 'movie_recommendation_cubit.dart';

@freezed
class MovieRecommendationState with _$MovieRecommendationState {
  const factory MovieRecommendationState.initial() = _Initial;
  const factory MovieRecommendationState.loading() = _Loading;
  const factory MovieRecommendationState.data(List<Movie> reommendations) =
      _Data;
  const factory MovieRecommendationState.error(String message) = _Error;
}
