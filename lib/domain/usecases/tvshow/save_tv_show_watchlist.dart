import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:equatable/equatable.dart';

class SaveTvShowWatchlist
    implements
        UseCase<Future<Either<Failure, String>>, SaveTvShowWatchlistParams> {
  final TvShowRepository repository;

  SaveTvShowWatchlist(this.repository);

  @override
  Future<Either<Failure, String>> execute(SaveTvShowWatchlistParams params) {
    return repository.saveWatchlist(params.tvShowDetail);
  }
}

class SaveTvShowWatchlistParams extends Equatable {
  final TvShowDetail tvShowDetail;

  SaveTvShowWatchlistParams(this.tvShowDetail);

  @override
  List<Object?> get props => [tvShowDetail];
}
