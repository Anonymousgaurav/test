import 'package:json_annotation/json_annotation.dart';

import '../../models/AuditModel.dart';
import 'BaseResponse.dart';

part 'AuditResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class AuditResponse implements BaseResponse {
  @JsonKey(name: "Data")
  final AuditModel data;

  AuditResponse(this.data);

  factory AuditResponse.fromJson(Map<String, dynamic> json) =>
      _$AuditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuditResponseToJson(this);
}
