import 'package:equatable/equatable.dart';

class SeasonDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final DateTime airDate;

  const SeasonDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.airDate,
  });

  @override
  List<Object?> get props =>
      [id, title, overview, posterPath, seasonNumber, airDate];
}
