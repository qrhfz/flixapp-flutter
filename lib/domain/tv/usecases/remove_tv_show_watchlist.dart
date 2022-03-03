import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class RemoveTVShowWatchlist {
  final TVShowRepository repository;

  RemoveTVShowWatchlist(this.repository);

  Future<Either<Failure, String>> call(int id) {
    return repository.removeWatchlist(id);
  }
}
