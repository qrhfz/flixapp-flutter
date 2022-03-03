import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'movie_now_playing_state.dart';
part 'movie_now_playing_cubit.freezed.dart';

class MovieNowPlayingCubit extends Cubit<MovieNowPlayingState> {
  final GetNowPlayingMovies _getNowPlaying;

  MovieNowPlayingCubit(this._getNowPlaying)
      : super(MovieNowPlayingState.initial());

  Future<void> fetchNowPlayingMovies() async {
    emit(MovieNowPlayingState.loading());
    final result = await _getNowPlaying.execute();
    result.fold(
      (failure) => emit(MovieNowPlayingState.error(failure.message)),
      (movies) => emit(MovieNowPlayingState.data(movies)),
    );
  }
}
