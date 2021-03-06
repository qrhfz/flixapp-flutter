import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'movie_recommendation_state.dart';
part 'movie_recommendation_cubit.freezed.dart';

class MovieRecommendationCubit extends Cubit<MovieRecommendationState> {
  late final GetMovieRecommendations _getMovieRecommendations;

  MovieRecommendationCubit(this._getMovieRecommendations)
      : super(const MovieRecommendationState.initial());

  Future<void> fetchRecommendations(int id) async {
    emit(const MovieRecommendationState.loading());
    final result = await _getMovieRecommendations.execute(id);
    result.fold(
      (failure) => emit(MovieRecommendationState.error(failure.message)),
      (movies) => emit(MovieRecommendationState.data(movies)),
    );
  }
}
