import 'package:equatable/equatable.dart';

class TvListItem extends Equatable {
  final String? backdropPath;
  final DateTime firstAirDate;
  final List<int> genreIds;
  final int id;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String title;
  final double voteAverage;
  final int voteCount;

  TvListItem({
    required this.id,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
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
