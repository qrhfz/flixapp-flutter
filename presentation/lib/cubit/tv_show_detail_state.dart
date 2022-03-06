part of 'tv_show_detail_cubit.dart';

@freezed
class TvShowDetailState with _$TvShowDetailState {
  const factory TvShowDetailState.initial() = _Initial;
  const factory TvShowDetailState.loading() = _Loading;
  const factory TvShowDetailState.data(TVShowDetail detail) = _Data;
  const factory TvShowDetailState.error(String message) = _Error;
}
