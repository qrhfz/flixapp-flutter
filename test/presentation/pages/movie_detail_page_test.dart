import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/cubit/movie_detail_cubit.dart';
import 'package:ditonton/presentation/cubit/movie_recommendation_cubit.dart';
import 'package:ditonton/presentation/cubit/movie_detail_watchlist_cubit.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

class MockMovieDetailCubit extends MockCubit<MovieDetailState>
    implements MovieDetailCubit {}

class MockMovieDetailRecommendationsCubit
    extends MockCubit<MovieRecommendationState>
    implements MovieRecommendationCubit {}

class MockMovieDetailWatchlistCubit extends MockCubit<MovieDetailWatchlistState>
    implements MovieDetailWatchlistCubit {}

void main() {
  late MockMovieDetailCubit detailCubit;
  late MockMovieDetailRecommendationsCubit recommendationsCubit;
  late MockMovieDetailWatchlistCubit watchlistCubit;
  setUp(() {
    detailCubit = MockMovieDetailCubit();
    recommendationsCubit = MockMovieDetailRecommendationsCubit();
    watchlistCubit = MockMovieDetailWatchlistCubit();

    when(() => detailCubit.state)
        .thenReturn(MovieDetailState.data(testMovieDetail));
    when(() => detailCubit.fetchMovieDetail(1)).thenAnswer((_) async {});
    when(() => watchlistCubit.state)
        .thenReturn(const MovieDetailWatchlistState.data(false));
    when(() => watchlistCubit.loadWatchlistStatus(1)).thenAnswer((_) async {});
    when(() => recommendationsCubit.state)
        .thenReturn(const MovieRecommendationState.data([]));
    when(() => recommendationsCubit.fetchRecommendations(1))
        .thenAnswer((_) async {});
    when(() => watchlistCubit.addWatchlist(testMovieDetail))
        .thenAnswer((_) async {});
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailCubit>.value(value: detailCubit),
        BlocProvider<MovieRecommendationCubit>.value(
            value: recommendationsCubit),
        BlocProvider<MovieDetailWatchlistCubit>.value(value: watchlistCubit),
      ],
      child: MaterialApp(home: body),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => watchlistCubit.state)
        .thenReturn(MovieDetailWatchlistState.data(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
      watchlistCubit,
      Stream.fromIterable(
        [
          MovieDetailWatchlistState.data(false),
          MovieDetailWatchlistState.success('Added to Watchlist')
        ],
      ),
    );

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));
    final watchlistButton = find.byType(ElevatedButton);
    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);

    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(
      watchlistCubit,
      Stream.fromIterable(
        [
          MovieDetailWatchlistState.data(false),
          MovieDetailWatchlistState.error('Failed')
        ],
      ),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
