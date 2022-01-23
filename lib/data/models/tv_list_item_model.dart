import 'package:ditonton/domain/entities/tv_list_item.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_list_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvListItemModel extends Equatable {
  TvListItemModel({
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
  final DateTime firstAirDate;
  final List<int> genreIds;
  final int id;
  final String overview;
  final double popularity;
  final String? posterPath;
  @JsonKey(name: 'name')
  final String title;
  final double voteAverage;
  final int voteCount;

  factory TvListItemModel.fromJson(Map<String, dynamic> json) =>
      _$TvListItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvListItemModelToJson(this);

  TvListItem toEntity() {
    return TvListItem(
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
