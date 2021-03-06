import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:presentation/cubit/movie_popular_cubit.dart';
import 'package:presentation/pages/popular_movies_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMoviePopularCubit extends MockCubit<MoviePopularState>
    implements MoviePopularCubit {}

void main() {
  late MockMoviePopularCubit mockCubit;

  setUp(() {
    mockCubit = MockMoviePopularCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MoviePopularCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  setUp(() {
    when(mockCubit.fetchPopularMovies).thenAnswer((_) async {});
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(const MoviePopularState.loading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockCubit.state)
        .thenReturn(const MoviePopularState.data(<Movie>[]));
    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockCubit.state)
        .thenReturn(const MoviePopularState.error('error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
