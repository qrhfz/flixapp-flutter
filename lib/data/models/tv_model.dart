import 'package:json_annotation/json_annotation.dart';

part 'tv_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvModel {
  TvModel({
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
  @JsonKey(name: 'name')
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  factory TvModel.fromJson(Map<String, dynamic> json) =>
      _$TvModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvModelToJson(this);
}
