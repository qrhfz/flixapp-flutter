import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/usecases/movie/get_movie_detail.dart';

part 'movie_detail_state.dart';
part 'movie_detail_cubit.freezed.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  late final GetMovieDetail _getMovieDetail;

  MovieDetailCubit({GetMovieDetail? getMovieDetail})
      : super(MovieDetailState.init()) {
    this._getMovieDetail = getMovieDetail ?? locator();
  }

  Future<void> fetchMovieDetail(int id) async {
    emit(MovieDetailState.loading());
    final detailResult = await _getMovieDetail.execute(id);

    detailResult.fold(
      (failure) {
        emit(MovieDetailState.error(failure.message));
      },
      (movie) {
        emit(MovieDetailState.data(movie));
      },
    );
  }
}
