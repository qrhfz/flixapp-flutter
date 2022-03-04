import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_top_rated_state.dart';
part 'tv_show_top_rated_cubit.freezed.dart';

class TvShowTopRatedCubit extends Cubit<TvShowTopRatedState> {
  final GetTopRatedTVShows _getTopRatedTVShows;
  TvShowTopRatedCubit(this._getTopRatedTVShows)
      : super(const TvShowTopRatedState.initial());

  Future<void> fetchTopRated() async {
    emit(const TvShowTopRatedState.loading());
    final result = await _getTopRatedTVShows();
    final newState = result.fold(
      (failure) => TvShowTopRatedState.error(failure.message),
      (shows) => TvShowTopRatedState.data(shows),
    );
    emit(newState);
  }
}
