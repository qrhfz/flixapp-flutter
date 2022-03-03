import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  late final SearchMovies _searchMovies;
  late final SearchTVShows _searchTVShows;
  SearchCubit({
    required SearchMovies searchMovies,
    required SearchTVShows searchTVShows,
  }) : super(SearchState.initial()) {
    _searchMovies = searchMovies;
    _searchTVShows = searchTVShows;
  }

  Future<void> fetchMovieSearch(String query) async {
    emit(SearchState.loading());
    final result = await _searchMovies.execute(query);
    result.fold(
      (failure) => emit(SearchState.error(failure.message)),
      (movies) => emit(SearchState.movieResult(movies)),
    );
  }

  Future<void> fetchTVShowSearch(String query) async {
    emit(SearchState.loading());
    final result = await _searchTVShows(query);
    result.fold(
      (failure) => emit(SearchState.error(failure.message)),
      (shows) => emit(SearchState.tvResult(shows)),
    );
  }
}
