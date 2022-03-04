import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_airing_state.dart';
part 'tv_show_airing_cubit.freezed.dart';

class TvShowAiringCubit extends Cubit<TvShowAiringState> {
  final GetAiringTVShows _getAiringTVShows;
  TvShowAiringCubit(this._getAiringTVShows)
      : super(const TvShowAiringState.initial());

  Future<void> fetchAiring() async {
    emit(const TvShowAiringState.loading());
    final result = await _getAiringTVShows();
    final newState = result.fold(
      (failure) => TvShowAiringState.error(failure.message),
      (shows) => TvShowAiringState.data(shows),
    );
    emit(newState);
  }
}
