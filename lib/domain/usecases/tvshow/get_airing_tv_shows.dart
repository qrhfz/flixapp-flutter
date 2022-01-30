import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/common/usecase.dart';

class GetAiringTvShows implements UseCase<TvShowsOrFailureFuture, void> {
  final TvShowRepository repository;

  GetAiringTvShows(this.repository);

  @override
  TvShowsOrFailureFuture execute(_) async {
    return repository.getAiringTvShows();
  }
}
