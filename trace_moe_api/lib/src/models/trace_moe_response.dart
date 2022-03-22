import 'package:json_annotation/json_annotation.dart';
import 'package:trace_moe_api/src/models/trace_moe_result.dart';

part 'trace_moe_response.g.dart';

@JsonSerializable()
class TraceMoeResponse {
  const TraceMoeResponse({
    required this.frameCount,
    required this.error,
    required this.result,
  });

  final int frameCount;
  final String error;
  final List<TraceMoeResult> result;

  factory TraceMoeResponse.fromJson(Map<String, dynamic> json) => _$TraceMoeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TraceMoeResponseToJson(this);
}