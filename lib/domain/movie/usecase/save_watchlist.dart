import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/movie/entities/movie_detail.dart';
import 'package:ditonton/domain/movie/repository/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
