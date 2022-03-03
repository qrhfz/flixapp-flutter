import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/tv_show_detail.dart';
import '../repository/tv_show_repository.dart';

class SaveTVShowWatchlist {
  final TVShowRepository repository;

  SaveTVShowWatchlist(this.repository);

  Future<Either<Failure, String>> call(TVShowDetail tvShowDetail) {
    return repository.saveWatchlist(tvShowDetail);
  }
}
