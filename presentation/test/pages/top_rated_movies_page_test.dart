import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:presentation/cubit/movie_top_rated_cubit.dart';
import 'package:presentation/pages/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieTopRatedCubit extends MockCubit<MovieTopRatedState>
    implements MovieTopRatedCubit {}

void main() {
  late MockMovieTopRatedCubit mockCubit;

  setUp(() {
    mockCubit = MockMovieTopRatedCubit();
    when(mockCubit.fetchTopRatedMovies).thenAnswer((_) async => {});
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MovieTopRatedCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(const MovieTopRatedState.loading());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(() => mockCubit.state)
        .thenReturn(const MovieTopRatedState.data(<Movie>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockCubit.state)
        .thenReturn(const MovieTopRatedState.error('error'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
