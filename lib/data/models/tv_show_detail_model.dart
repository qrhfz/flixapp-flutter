import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TVShowDetailModel extends Equatable {
  final int id;
  final List<GenreModel> genres;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final double popularity;
  final String? posterPath;
  @JsonKey(name: 'name')
  final String title;
  final double? voteAverage;
  final int? voteCount;

  TVShowDetailModel({
    required this.id,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.title,
    this.voteAverage,
    this.voteCount,
    required this.genres,
  });

  TVShowDetail toEntity() => TVShowDetail(
        id: id,
        genres: genres.map((e) => e.toEntity()).toList(),
        numberOfEpisodes: numberOfEpisodes,
        numberOfSeasons: numberOfSeasons,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  factory TVShowDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TVShowDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowDetailModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        numberOfEpisodes,
        numberOfSeasons,
        title,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
