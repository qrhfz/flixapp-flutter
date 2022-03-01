import 'package:bloc/bloc.dart';
import 'package:ditonton/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/movie/get_watchlist_status.dart';
import '../../domain/usecases/movie/remove_watchlist.dart';
import '../../domain/usecases/movie/save_watchlist.dart';

part 'movie_detail_watchlist_state.dart';
part 'movie_detail_watchlist_cubit.freezed.dart';

class MovieDetailWatchlistCubit extends Cubit<MovieDetailWatchlistState> {
  late final GetWatchListStatus getWatchListStatus;
  late final SaveWatchlist saveWatchlist;
  late final RemoveWatchlist removeWatchlist;

  MovieDetailWatchlistCubit({
    GetWatchListStatus? getWatchListStatus,
    SaveWatchlist? saveWatchlist,
    RemoveWatchlist? removeWatchlist,
  }) : super(MovieDetailWatchlistState.data(false)) {
    this.getWatchListStatus = getWatchListStatus ?? locator();
    this.saveWatchlist = saveWatchlist ?? locator();
    this.removeWatchlist = removeWatchlist ?? locator();
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

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
    final result = await removeWatchlist.execute(movie);

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
    final result = await getWatchListStatus.execute(id);
    emit(MovieDetailWatchlistState.data(result));
  }
}
