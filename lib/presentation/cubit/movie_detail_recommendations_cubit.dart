import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/usecases/movie/get_movie_recommendations.dart';
import '../../injection.dart';

part 'movie_detail_recommendations_state.dart';
part 'movie_detail_recommendations_cubit.freezed.dart';

class MovieDetailRecommendationsCubit
    extends Cubit<MovieDetailRecommendationsState> {
  late final GetMovieRecommendations _getMovieRecommendations;

  MovieDetailRecommendationsCubit(
      {GetMovieRecommendations? getMovieRecommendations})
      : super(MovieDetailRecommendationsState.initial()) {
    this._getMovieRecommendations = getMovieRecommendations ?? locator();
  }

  Future<void> fetchRecommendations(int id) async {
    emit(MovieDetailRecommendationsState.loading());
    final result = await _getMovieRecommendations.execute(id);
    result.fold(
      (failure) => emit(MovieDetailRecommendationsState.error(failure.message)),
      (movies) => emit(MovieDetailRecommendationsState.data(movies)),
    );
  }
}
