import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'movie_popular_state.dart';
part 'movie_popular_cubit.freezed.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  final GetPopularMovies _getPopular;
  MoviePopularCubit(this._getPopular) : super(const MoviePopularState.initial());

  Future<void> fetchPopularMovies() async {
    emit(const MoviePopularState.loading());
    final result = await _getPopular.execute();
    result.fold(
      (failure) => emit(MoviePopularState.error(failure.message)),
      (movies) => emit(MoviePopularState.data(movies)),
    );
  }
}
