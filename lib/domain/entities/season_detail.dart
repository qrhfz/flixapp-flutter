import 'package:ditonton/domain/entities/episode.dart';
import 'package:equatable/equatable.dart';

class SeasonDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final DateTime airDate;
  final List<Episode> episodes;

  SeasonDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.airDate,
    required this.episodes,
  });

  @override
  List<Object?> get props =>
      [id, title, overview, posterPath, seasonNumber, airDate, episodes];
}
