import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_popular_state.dart';
part 'tv_show_popular_cubit.freezed.dart';

class TvShowPopularCubit extends Cubit<TvShowPopularState> {
  final GetPopularTVShows _getPopularTVShows;
  TvShowPopularCubit(this._getPopularTVShows)
      : super(const TvShowPopularState.initial());

  Future<void> fetchPopular() async {
    emit(const TvShowPopularState.loading());
    final result = await _getPopularTVShows();
    final newState = result.fold(
      (failure) => TvShowPopularState.error(failure.message),
      (shows) => TvShowPopularState.data(shows),
    );
    emit(newState);
  }
}
