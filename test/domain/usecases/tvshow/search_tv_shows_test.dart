import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/search_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  final TVShowRepository repository = MockTvShowRepository();
  final SearchTVShows usecase = SearchTVShows(repository);

  group('Searching tv shows', () {
    test('Seaching tv shows should result in a list of tv shows', () async {
      final List<TVShow> dummy = [];
      when(repository.searchTvShows("test"))
          .thenAnswer((_) async => Right(dummy));
      final res = await usecase.call("test");
      assert(res == Right<Failure, List<TVShow>>(dummy));
    });

    test('Searching whith empty string should return a Failure', () async {
      final res = await usecase.call("");
      assert(res.isLeft());

      res.fold((fail) {
        assert(fail is ArgumentFailure);
      }, (result) {
        throw Exception();
      });
    });
  });
}
