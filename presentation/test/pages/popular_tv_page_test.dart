import 'package:bloc_test/bloc_test.dart';
import 'package:domain/tv/entities/tv_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/cubit/cubit.dart';
import 'package:presentation/pages/pages.dart';

class MockTvShowPopularCubit extends MockCubit<TvShowPopularState>
    implements TvShowPopularCubit {}

void main() {
  late MockTvShowPopularCubit cubit;

  setUp(() {
    cubit = MockTvShowPopularCubit();
    when(cubit.fetchPopular).thenAnswer((_) async => {});
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvShowPopularCubit>.value(
      value: cubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => cubit.state).thenReturn(const TvShowPopularState.loading());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const PopularTvPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(() => cubit.state)
        .thenReturn(const TvShowPopularState.data(<TVShow>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const PopularTvPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => cubit.state).thenReturn(const TvShowPopularState.error('error'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const PopularTvPage()));

    expect(textFinder, findsOneWidget);
  });
}
