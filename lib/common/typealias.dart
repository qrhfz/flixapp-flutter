import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

typedef FutureTvShowList = Future<Either<Failure, List<TvShow>>>;
typedef FutureTvShowDetail = Future<Either<Failure, TvShowDetail>>;
