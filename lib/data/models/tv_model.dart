import 'package:ditonton/domain/entities/tv.dart';

class TvModel extends Tv {
  TvModel({
    required int id,
    required bool adult,
    required String backdropPath,
    required DateTime firstAirDate,
    required List<int> genreIds,
    required DateTime lastAirDate,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required double voteAverage,
    required int voteCount,
  }) : super(
          id: id,
          adult: adult,
          backdropPath: backdropPath,
          firstAirDate: firstAirDate,
          posterPath: posterPath,
          title: title,
          lastAirDate: lastAirDate,
          numberOfSeasons: numberOfSeasons,
          numberOfEpisodes: numberOfEpisodes,
          voteCount: voteCount,
          voteAverage: voteAverage,
          genreIds: genreIds,
          popularity: popularity,
          originalTitle: originalTitle,
          overview: overview,
        );
}
