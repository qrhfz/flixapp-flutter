import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_state.dart';
part 'movie_detail_cubit.freezed.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail _getMovieDetail;

  MovieDetailCubit(this._getMovieDetail) : super(const MovieDetailState.initial());
  Future<void> fetchMovieDetail(int id) async {
    emit(const MovieDetailState.loading());
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
