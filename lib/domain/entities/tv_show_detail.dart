import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

import 'episode.dart';
import 'season.dart';

class TvShowDetail extends Equatable {
  final int id;
  final String? backdropPath;
  final DateTime firstAirDate;
  final DateTime lastAirDate;
  final List<Genre> genres;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String title;
  final double? voteAverage;
  final int? voteCount;
  final List<Season>? seasons;
  final Episode? lastEpisodeToAir;

  TvShowDetail({
    required this.id,
    this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.lastAirDate,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.seasons,
    required this.lastEpisodeToAir,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        firstAirDate,
        genres,
        lastAirDate,
        numberOfEpisodes,
        numberOfSeasons,
        originalTitle,
        overview,
        popularity,
        posterPath,
        title,
        voteAverage,
        voteCount,
        seasons,
        lastEpisodeToAir,
      ];
}
