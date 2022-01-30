import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

typedef TvShowsOrFailureFuture = Future<Either<Failure, List<TvShow>>>;
typedef TvShowDetailOrFailureFuture = Future<Either<Failure, TvShowDetail>>;

typedef TvShowModelssOrFailureFuture
    = Future<Either<Failure, List<TvShowModel>>>;

typedef TvShowDetailModelOrFailureFuture
    = Future<Either<Failure, TvShowDetailModel>>;
