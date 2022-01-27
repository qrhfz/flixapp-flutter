import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

import 'episode.dart';
import 'season.dart';

class TvShowDetail extends Equatable {
  final int id;
  final String? backdropPath;
  final DateTime? firstAirDate;
  final DateTime? lastAirDate;
  final List<Genre>? genres;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final List<Season>? seasons;
  final Episode? lastEpisodeToAir;

  TvShowDetail({
    required this.id,
    this.backdropPath,
    this.firstAirDate,
    this.genres,
    this.lastAirDate,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.seasons,
    this.lastEpisodeToAir,
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
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        seasons,
        lastEpisodeToAir,
      ];
}
