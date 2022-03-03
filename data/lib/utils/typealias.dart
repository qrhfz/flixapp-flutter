import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

import '../models/tv_show_detail_model.dart';
import '../models/tv_show_model.dart';

typedef TvShowModelsOrFailureFuture
    = Future<Either<Failure, List<TVShowModel>>>;

typedef TvShowDetailModelOrFailureFuture
    = Future<Either<Failure, TVShowDetailModel>>;
