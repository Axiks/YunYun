// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trace_moe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraceMoeResponse _$TraceMoeResponseFromJson(Map<String, dynamic> json) =>
    TraceMoeResponse(
      frameCount: json['frameCount'] as int,
      error: json['error'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => TraceMoeResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TraceMoeResponseToJson(TraceMoeResponse instance) =>
    <String, dynamic>{
      'frameCount': instance.frameCount,
      'error': instance.error,
      'result': instance.result,
    };
