import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TVShowModel extends Equatable {
  TVShowModel({
    required this.id,
    required this.genreIds,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final List<int>? genreIds;
  final int id;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  @JsonKey(name: 'name')
  final String title;
  final double voteAverage;
  final int voteCount;

  factory TVShowModel.fromJson(Map<String, dynamic> json) =>
      _$TVShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowModelToJson(this);

  TVShow toEntity() {
    return TVShow(
      id: id,
      overview: overview,
      title: title,
      posterPath: posterPath,
      popularity: popularity,
    );
  }

  @override
  List<Object?> get props => [
        id,
        genreIds,
        overview,
        popularity,
        posterPath,
        title,
        voteAverage,
        voteCount,
      ];
}
