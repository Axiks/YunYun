import 'package:json_annotation/json_annotation.dart';

part 'trace_moe_result.g.dart';

@JsonSerializable()
class TraceMoeResult {
  const TraceMoeResult({
    required this.anilist,
    required this.filename,
    this.episode,
    required this.from,
    required this.to,
    required this.similarity,
    required this.video,
    required this.image,
  });

  final int anilist;
  final String filename;
  final int? episode;
  final double from;
  final double to;
  final double similarity;
  final String video;
  final String image;

  factory TraceMoeResult.fromJson(Map<String, dynamic> json) => _$TraceMoeResultFromJson(json);
  Map<String, dynamic> toJson() => _$TraceMoeResultToJson(this);
}