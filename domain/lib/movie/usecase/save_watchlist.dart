import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/movie_detail.dart';
import '../repository/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
