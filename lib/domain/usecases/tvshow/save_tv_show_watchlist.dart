import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class SaveTvShowWatchlist
    implements UseCase<Future<Either<Failure, String>>, TvShowDetail> {
  final TvShowRepository repository;

  SaveTvShowWatchlist(this.repository);

  @override
  Future<Either<Failure, String>> execute(TvShowDetail tvShowDetail) {
    return repository.saveWatchlist(tvShowDetail);
  }
}
