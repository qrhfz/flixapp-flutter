part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.movieResult(List<Movie> result) = _MovieResult;
  const factory SearchState.tvResult(List<TVShow> result) = _TVResult;
  const factory SearchState.error(String message) = _Error;
}
