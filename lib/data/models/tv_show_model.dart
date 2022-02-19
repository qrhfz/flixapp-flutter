import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvShowModel extends Equatable {
  TvShowModel({
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

  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String overview;
  final double popularity;
  final String? posterPath;
  @JsonKey(name: 'name')
  final String title;
  final double voteAverage;
  final int voteCount;

  factory TvShowModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowModelToJson(this);

  TvShow toEntity() {
    return TvShow(
      id: id,
      overview: overview,
      title: title,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      backdropPath: backdropPath,
      popularity: popularity,
      voteAverage: voteAverage,
      genreIds: genreIds,
      voteCount: voteCount,
    );
  }

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
