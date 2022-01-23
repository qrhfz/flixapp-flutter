import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final DateTime? firstAirDate;
  final DateTime? lastAirDate;
  final List<int>? genreIds;
  final int id;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  Tv({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
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
  });

  @override
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        firstAirDate,
        genreIds,
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
      ];
}
