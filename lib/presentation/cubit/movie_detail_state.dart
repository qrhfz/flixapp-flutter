part of 'movie_detail_cubit.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.init() = _Init;
  const factory MovieDetailState.loading() = _Loading;
  const factory MovieDetailState.data(MovieDetail movie) = _Loaded;
  const factory MovieDetailState.error(String message) = _Error;
}
