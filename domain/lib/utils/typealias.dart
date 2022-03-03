import 'package:dartz/dartz.dart';

import '../utils/failure.dart';
import '../tv/entities/tv_show.dart';
import '../tv/entities/tv_show_detail.dart';

typedef TvShowsOrFailureFuture = Future<Either<Failure, List<TVShow>>>;
typedef TvShowDetailOrFailureFuture = Future<Either<Failure, TVShowDetail>>;
