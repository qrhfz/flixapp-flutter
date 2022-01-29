import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<int>? genreIds;
  final int id;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String title;
  final double? voteAverage;
  final int? voteCount;

  TvShow({
    required this.id,
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.overview,
    this.popularity,
    this.posterPath,
    required this.title,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        firstAirDate,
        genreIds,
        overview,
        popularity,
        posterPath,
        title,
        voteAverage,
        voteCount,
      ];
}
