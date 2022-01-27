import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/common/usecase.dart';

class GetAiringTvShows implements UseCase<FutureTvShowList, NoParams> {
  final TvShowRepository repository;

  GetAiringTvShows(this.repository);

  @override
  FutureTvShowList execute(_) async {
    return repository.getAiringTvShows();
  }
}
