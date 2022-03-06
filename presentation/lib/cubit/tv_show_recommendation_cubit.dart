import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_recommendation_state.dart';
part 'tv_show_recommendation_cubit.freezed.dart';

class TvShowRecommendationCubit extends Cubit<TvShowRecommendationState> {
  final GetTvRecommendations _getTvRecommendations;
  TvShowRecommendationCubit(this._getTvRecommendations)
      : super(const TvShowRecommendationState.initial());

  Future<void> fetchRecommendation(int id) async {
    emit(const TvShowRecommendationState.loading());
    final result = await _getTvRecommendations(id);
    final newState = result.fold(
      (failure) => TvShowRecommendationState.error(failure.message),
      (shows) => TvShowRecommendationState.data(shows),
    );

    emit(newState);
  }
}
