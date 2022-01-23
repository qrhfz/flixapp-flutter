import 'dart:ffi';

class Episode {
  final int id;
  final String title;
  final String overview;
  final String? stillPath;
  final int seasonNumber;
  final DateTime airDate;
  final Double voteAverage;
  final int voteCount;

  Episode({
    required this.id,
    required this.title,
    required this.overview,
    required this.stillPath,
    required this.seasonNumber,
    required this.airDate,
    required this.voteAverage,
    required this.voteCount,
  });
}
