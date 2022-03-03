import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/domain/tv/entities/tv_show.dart';
import 'package:ditonton/domain/tv/entities/tv_show_detail.dart';

typedef TvShowsOrFailureFuture = Future<Either<Failure, List<TVShow>>>;
typedef TvShowDetailOrFailureFuture = Future<Either<Failure, TVShowDetail>>;

typedef TvShowModelsOrFailureFuture
    = Future<Either<Failure, List<TVShowModel>>>;

typedef TvShowDetailModelOrFailureFuture
    = Future<Either<Failure, TVShowDetailModel>>;
