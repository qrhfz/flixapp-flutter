import 'package:bloc/bloc.dart';
import 'package:ditonton/common/failure.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/movie/get_now_playing_movies.dart';
import '../../domain/usecases/movie/get_popular_movies.dart';
import '../../domain/usecases/movie/get_top_rated_movies.dart';
import '../../injection.dart';

part 'movie_list_state.dart';
part 'movie_list_cubit.freezed.dart';

class MovieListCubit extends Cubit<MovieListState> {
  late final GetNowPlayingMovies _getNowPlaying;
  late final GetTopRatedMovies _getTopRated;
  late final GetPopularMovies _getPopular;
  MovieListCubit({
    GetNowPlayingMovies? getNowPlaying,
    GetTopRatedMovies? getTopRated,
    GetPopularMovies? getPopular,
  }) : super(MovieListState.initial()) {
    _getNowPlaying = getNowPlaying ?? locator();
    _getTopRated = getTopRated ?? locator();
    ;
    _getPopular = getPopular ?? locator();
    ;
  }

  Future<void> fetchMovies() async {
    emit(MovieListState.loading());
    final topRated = await _getTopRated.execute();
    final nowPlaying = await _getNowPlaying.execute();
    final popular = await _getPopular.execute();

    if (topRated.isLeft()) {
      final message =
          topRated.swap().getOrElse(() => ConnectionFailure()).message;
      return emit(MovieListState.error(message));
    }

    if (nowPlaying.isLeft()) {
      final message =
          nowPlaying.swap().getOrElse(() => ConnectionFailure()).message;
      return emit(MovieListState.error(message));
    }

    if (popular.isLeft()) {
      final message =
          popular.swap().getOrElse(() => ConnectionFailure()).message;
      return emit(MovieListState.error(message));
    }

    emit(MovieListState.data(
      topRated: topRated.getOrElse(() => []),
      nowPlaying: nowPlaying.getOrElse(() => []),
      popular: popular.getOrElse(() => []),
    ));
  }
}
