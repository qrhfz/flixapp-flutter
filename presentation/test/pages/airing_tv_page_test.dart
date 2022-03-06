import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/cubit/cubit.dart';
import 'package:presentation/pages/pages.dart';

class MockTvShowAiringCubit extends MockCubit<TvShowAiringState>
    implements TvShowAiringCubit {}

void main() {
  late TvShowAiringCubit cubit;

  setUp(() {
    cubit = MockTvShowAiringCubit();
    when(() => cubit.fetchAiring()).thenAnswer((_) async {});
  });

  Widget makeTestableWidget() {
    return BlocProvider<TvShowAiringCubit>.value(
      value: cubit,
      child: const MaterialApp(
        home: AiringTVShowPage(),
      ),
    );
  }

  testWidgets(
    'Page should display center progress bar when loading',
    (tester) async {
      when(() => cubit.state).thenReturn(const TvShowAiringState.loading());

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(makeTestableWidget());

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Page should display ListView when data is loaded',
    (tester) async {
      when(() => cubit.state)
          .thenReturn(const TvShowAiringState.data(<TVShow>[]));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(makeTestableWidget());

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => cubit.state)
        .thenReturn(const TvShowAiringState.error('error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget());

    expect(textFinder, findsOneWidget);
  });
}
