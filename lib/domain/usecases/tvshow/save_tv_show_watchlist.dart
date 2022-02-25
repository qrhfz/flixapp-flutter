import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class SaveTVShowWatchlist {
  final TVShowRepository repository;

  SaveTVShowWatchlist(this.repository);

  Future<Either<Failure, String>> call(TVShowDetail tvShowDetail) {
    return repository.saveWatchlist(tvShowDetail);
  }
}
