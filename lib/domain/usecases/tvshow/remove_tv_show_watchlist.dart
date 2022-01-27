import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class RemoveTvShowWatchlist
    implements UseCase<Future<Either<Failure, String>>, int> {
  final TvShowRepository repository;

  RemoveTvShowWatchlist(this.repository);

  @override
  Future<Either<Failure, String>> execute(int arg) {
    return repository.deleteWatchlist(arg);
  }
}
