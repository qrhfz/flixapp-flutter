import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_detail_watchlist_state.dart';
part 'tv_show_detail_watchlist_cubit.freezed.dart';

class TvShowDetailWatchlistCubit extends Cubit<TvShowDetailWatchlistState> {
  late final GetTVShowWatchlistStatus _getStatus;
  late final SaveTVShowWatchlist _save;
  late final RemoveTVShowWatchlist _remove;
  TvShowDetailWatchlistCubit({
    required GetTVShowWatchlistStatus getStatus,
    required SaveTVShowWatchlist save,
    required RemoveTVShowWatchlist remove,
  }) : super(const TvShowDetailWatchlistState.data(false)) {
    _getStatus = getStatus;
    _save = save;
    _remove = remove;
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await _getStatus(id);
    emit(TvShowDetailWatchlistState.data(result));
  }

  Future<void> saveWatchlist(TVShowDetail show) async {
    final result = await _save(show);
    final newState = result.fold(
      (failure) => TvShowDetailWatchlistState.error(failure.message),
      (successMessage) => TvShowDetailWatchlistState.success(successMessage),
    );

    emit(newState);
    loadWatchlistStatus(show.id);
  }

  Future<void> removeWatchlist(int id) async {
    final result = await _remove(id);
    final newState = result.fold(
      (failure) => TvShowDetailWatchlistState.error(failure.message),
      (successMessage) => TvShowDetailWatchlistState.success(successMessage),
    );

    emit(newState);
    loadWatchlistStatus(id);
  }
}
