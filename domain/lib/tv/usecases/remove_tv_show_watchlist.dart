import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../repository/tv_show_repository.dart';

class RemoveTVShowWatchlist {
  final TVShowRepository repository;

  RemoveTVShowWatchlist(this.repository);

  Future<Either<Failure, String>> call(int id) {
    return repository.removeWatchlist(id);
  }
}
