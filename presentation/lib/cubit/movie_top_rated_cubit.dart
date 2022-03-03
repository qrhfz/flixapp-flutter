import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'movie_top_rated_state.dart';
part 'movie_top_rated_cubit.freezed.dart';

class MovieTopRatedCubit extends Cubit<MovieTopRatedState> {
  final GetTopRatedMovies _getTopRated;
  MovieTopRatedCubit(this._getTopRated) : super(const MovieTopRatedState.initial());

  Future<void> fetchTopRatedMovies() async {
    emit(const MovieTopRatedState.loading());
    final result = await _getTopRated.execute();
    result.fold(
      (failure) => emit(MovieTopRatedState.error(failure.message)),
      (movies) => emit(MovieTopRatedState.data(movies)),
    );
  }
}
