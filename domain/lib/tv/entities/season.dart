import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final DateTime? airDate;
  final int episodeCount;

  const Season({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.airDate,
    required this.episodeCount,
  });

  @override
  List<Object?> get props =>
      [id, title, overview, posterPath, seasonNumber, airDate, episodeCount];
}
