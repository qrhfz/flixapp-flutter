import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_detail_state.dart';
part 'tv_show_detail_cubit.freezed.dart';

class TvShowDetailCubit extends Cubit<TvShowDetailState> {
  final GetTVShowDetail _getTVShowDetail;
  TvShowDetailCubit(this._getTVShowDetail)
      : super(const TvShowDetailState.initial());

  Future<void> fetchDetail(int id) async {
    emit(const TvShowDetailState.loading());
    final result = await _getTVShowDetail(id);
    final newState = result.fold(
      (failure) => TvShowDetailState.error(failure.message),
      (detail) => TvShowDetailState.data(detail),
    );

    emit(newState);
  }
}
