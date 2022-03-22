// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trace_moe_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraceMoeResult _$TraceMoeResultFromJson(Map<String, dynamic> json) =>
    TraceMoeResult(
      anilist: json['anilist'] as int,
      filename: json['filename'] as String,
      episode: json['episode'] as int?,
      from: (json['from'] as num).toDouble(),
      to: (json['to'] as num).toDouble(),
      similarity: (json['similarity'] as num).toDouble(),
      video: json['video'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TraceMoeResultToJson(TraceMoeResult instance) =>
    <String, dynamic>{
      'anilist': instance.anilist,
      'filename': instance.filename,
      'episode': instance.episode,
      'from': instance.from,
      'to': instance.to,
      'similarity': instance.similarity,
      'video': instance.video,
      'image': instance.image,
    };
