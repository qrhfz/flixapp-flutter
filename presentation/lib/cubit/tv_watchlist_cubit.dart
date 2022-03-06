import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_watchlist_state.dart';
part 'tv_watchlist_cubit.freezed.dart';

class TvWatchlistCubit extends Cubit<TvWatchlistState> {
  final GetTVShowWatchlist _getTVShowWatchlist;
  TvWatchlistCubit(this._getTVShowWatchlist)
      : super(const TvWatchlistState.initial());

  Future<void> fetchWatchlist() async {
    emit(const TvWatchlistState.loading());
    final movieResult = await _getTVShowWatchlist();

    final newState = movieResult.fold(
      (failure) => TvWatchlistState.error(failure.message),
      (movies) => TvWatchlistState.data(movies),
    );

    emit(newState);
  }
}
