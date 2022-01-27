import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? stillPath;
  final int seasonNumber;
  final DateTime airDate;
  final double voteAverage;
  final int voteCount;
  final int episodeNumber;

  Episode({
    required this.id,
    required this.title,
    required this.overview,
    required this.stillPath,
    required this.seasonNumber,
    required this.airDate,
    required this.voteAverage,
    required this.voteCount,
    required this.episodeNumber,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        stillPath,
        seasonNumber,
        airDate,
        voteAverage,
        voteCount,
        episodeNumber,
      ];
}
