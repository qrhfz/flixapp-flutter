import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetPopularTvShows implements UseCase<TvShowsOrFailureFuture, void> {
  final TvShowRepository tvRepository;

  GetPopularTvShows(this.tvRepository);

  Future<Either<Failure, List<TvShow>>> execute(_) {
    return tvRepository.getPopularTvShows();
  }
}
