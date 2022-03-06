part of 'tv_show_recommendation_cubit.dart';

@freezed
class TvShowRecommendationState with _$TvShowRecommendationState {
  const factory TvShowRecommendationState.initial() = _Initial;
  const factory TvShowRecommendationState.loading() = _Loading;
  const factory TvShowRecommendationState.data(List<TVShow> shows) = _Data;
  const factory TvShowRecommendationState.error(String message) = _Error;
}
