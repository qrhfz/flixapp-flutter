// Mocks generated by Mockito 5.1.0 from annotations
// in data/test/repositories/tv_show_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:data/datasources/tv_local_data_source.dart' as _i8;
import 'package:data/datasources/tv_remote_data_source.dart' as _i3;
import 'package:data/models/tv_show_detail_model.dart' as _i7;
import 'package:data/models/tv_show_model.dart' as _i6;
import 'package:data/models/tv_show_table.dart' as _i9;
import 'package:domain/domain.dart' as _i5;
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

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [TVShowRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVShowRemoteDataSource extends _i1.Mock
    implements _i3.TVShowRemoteDataSource {
  MockTVShowRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>
      getPopularTvShows() => (super.noSuchMethod(
              Invocation.method(#getPopularTvShows, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVShowModel>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>
      getTopRatedTvShows() => (super.noSuchMethod(
              Invocation.method(#getTopRatedTvShows, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVShowModel>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>
      getAiringTvShows() => (super.noSuchMethod(
              Invocation.method(#getAiringTvShows, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVShowModel>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.TVShowDetailModel>> getTvShowDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvShowDetail, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i7.TVShowDetailModel>>.value(
                      _FakeEither_0<_i5.Failure, _i7.TVShowDetailModel>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i7.TVShowDetailModel>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>> searchTvShow(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvShow, [query]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVShowModel>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>
      getTvShowRecommendations(int? id) => (super.noSuchMethod(
              Invocation.method(#getTvShowRecommendations, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVShowModel>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowModel>>>);
}

/// A class which mocks [TVShowLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVShowLocalDataSource extends _i1.Mock
    implements _i8.TVShowLocalDataSource {
  MockTVShowLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.DatabaseFailure, List<_i9.TVShowTable>>>
      getTvWatchlist() => (super.noSuchMethod(
          Invocation.method(#getTvWatchlist, []),
          returnValue: Future<
                  _i2.Either<_i5.DatabaseFailure, List<_i9.TVShowTable>>>.value(
              _FakeEither_0<_i5.DatabaseFailure, List<_i9.TVShowTable>>())) as _i4
          .Future<_i2.Either<_i5.DatabaseFailure, List<_i9.TVShowTable>>>);
  @override
  _i4.Future<_i2.Either<_i5.DatabaseFailure, String>> insertWatchlist(
          _i9.TVShowTable? tvShow) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [tvShow]),
          returnValue: Future<_i2.Either<_i5.DatabaseFailure, String>>.value(
              _FakeEither_0<_i5.DatabaseFailure, String>())) as _i4
          .Future<_i2.Either<_i5.DatabaseFailure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DatabaseFailure, String>> removeWatchlist(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [id]),
          returnValue: Future<_i2.Either<_i5.DatabaseFailure, String>>.value(
              _FakeEither_0<_i5.DatabaseFailure, String>())) as _i4
          .Future<_i2.Either<_i5.DatabaseFailure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DatabaseFailure, _i9.TVShowTable?>> getTvById(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<
                      _i2.Either<_i5.DatabaseFailure, _i9.TVShowTable?>>.value(
                  _FakeEither_0<_i5.DatabaseFailure, _i9.TVShowTable?>()))
          as _i4.Future<_i2.Either<_i5.DatabaseFailure, _i9.TVShowTable?>>);
}