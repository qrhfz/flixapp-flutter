// Mocks generated by Mockito 5.1.0 from annotations
// in presentation/test/cubit/tv_show_top_rated_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:domain/tv/entities/tv_show.dart' as _i7;
import 'package:domain/tv/repository/tv_show_repository.dart' as _i2;
import 'package:domain/tv/usecases/get_top_rated_tv_shows.dart' as _i4;
import 'package:domain/utils/failure.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTVShowRepository_0 extends _i1.Fake implements _i2.TVShowRepository {
}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetTopRatedTVShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTVShows extends _i1.Mock
    implements _i4.GetTopRatedTVShows {
  MockGetTopRatedTVShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVShowRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVShowRepository_0()) as _i2.TVShowRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TVShow>>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.TVShow>>>.value(
              _FakeEither_1<_i6.Failure, List<_i7.TVShow>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.TVShow>>>);
}
