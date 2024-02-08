// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuditResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditResponse _$AuditResponseFromJson(Map<String, dynamic> json) =>
    AuditResponse(
      AuditModel.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuditResponseToJson(AuditResponse instance) =>
    <String, dynamic>{
      'Data': instance.data.toJson(),
    };
