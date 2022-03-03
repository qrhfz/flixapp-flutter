import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/movie/entities/movie.dart';
import '../../domain/movie/usecase/get_top_rated_movies.dart';

part 'movie_top_rated_state.dart';
part 'movie_top_rated_cubit.freezed.dart';

class MovieTopRatedCubit extends Cubit<MovieTopRatedState> {
  final GetTopRatedMovies _getTopRated;
  MovieTopRatedCubit(this._getTopRated) : super(MovieTopRatedState.initial());

  Future<void> fetchTopRatedMovies() async {
    emit(MovieTopRatedState.loading());
    final result = await _getTopRated.execute();
    result.fold(
      (failure) => emit(MovieTopRatedState.error(failure.message)),
      (movies) => emit(MovieTopRatedState.data(movies)),
    );
  }
}
