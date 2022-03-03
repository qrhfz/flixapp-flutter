import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'movie_detail_watchlist_state.dart';
part 'movie_detail_watchlist_cubit.freezed.dart';

class MovieDetailWatchlistCubit extends Cubit<MovieDetailWatchlistState> {
  late final GetWatchListStatus _getWatchListStatus;
  late final SaveWatchlist _saveWatchlist;
  late final RemoveWatchlist _removeWatchlist;

  MovieDetailWatchlistCubit({
    required GetWatchListStatus getWatchListStatus,
    required SaveWatchlist saveWatchlist,
    required RemoveWatchlist removeWatchlist,
  }) : super(MovieDetailWatchlistState.data(false)) {
    this._getWatchListStatus = getWatchListStatus;
    this._saveWatchlist = saveWatchlist;
    this._removeWatchlist = removeWatchlist;
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await _saveWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieDetailWatchlistState.error(failure.message));
      },
      (successMessage) async {
        emit(MovieDetailWatchlistState.success(successMessage));
      },
    );

    await loadWatchlistStatus(movie.id);
  }

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await _removeWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieDetailWatchlistState.error(failure.message));
      },
      (successMessage) async {
        emit(MovieDetailWatchlistState.success(successMessage));
      },
    );

    await loadWatchlistStatus(movie.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await _getWatchListStatus.execute(id);
    emit(MovieDetailWatchlistState.data(result));
  }
}
