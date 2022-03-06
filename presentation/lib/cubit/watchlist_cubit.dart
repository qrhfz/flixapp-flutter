import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_state.dart';
part 'watchlist_cubit.freezed.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final GetWatchlistMovies _getWatchlistMovies;

  WatchlistCubit(
    this._getWatchlistMovies,
  ) : super(const WatchlistState.initial());

  Future<void> fetchWatchlist() async {
    emit(const WatchlistState.loading());
    final movieResult = await _getWatchlistMovies.execute();

    final newState = movieResult.fold(
      (failure) => WatchlistState.error(failure.message),
      (movies) => WatchlistState.data(movies),
    );

    emit(newState);
  }
}
