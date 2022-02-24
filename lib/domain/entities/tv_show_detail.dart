import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

import 'episode.dart';
import 'season.dart';

class TvShowDetail extends Equatable {
  final int id;
  final List<Genre> genres;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String title;
  final double? voteAverage;
  final int? voteCount;

  TvShowDetail({
    required this.id,
    required this.genres,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        genres,
        numberOfEpisodes,
        numberOfSeasons,
        overview,
        popularity,
        posterPath,
        title,
        voteAverage,
        voteCount,
      ];
}
