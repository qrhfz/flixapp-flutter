import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/usecases/movie/get_movie_recommendations.dart';

part 'movie_recommendation_state.dart';
part 'movie_recommendation_cubit.freezed.dart';

class MovieRecommendationCubit extends Cubit<MovieRecommendationState> {
  late final GetMovieRecommendations _getMovieRecommendations;

  MovieRecommendationCubit(this._getMovieRecommendations)
      : super(MovieRecommendationState.initial());

  Future<void> fetchRecommendations(int id) async {
    emit(MovieRecommendationState.loading());
    final result = await _getMovieRecommendations.execute(id);
    result.fold(
      (failure) => emit(MovieRecommendationState.error(failure.message)),
      (movies) => emit(MovieRecommendationState.data(movies)),
    );
  }
}
