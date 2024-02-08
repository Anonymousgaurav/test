// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuditModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditModel _$AuditModelFromJson(Map<String, dynamic> json) => AuditModel(
      json['id'] as int?,
      json['requestDate'] as String?,
      json['auditStaus'] as String?,
      json['auditName'] as String?,
      json['auditNumber'] as String?,
      json['auditType'] as String?,
      json['supplierName'] as String?,
      json['templateId'] as int?,
      json['templateName'] as String?,
      json['auditTypeName'] as String?,
      (json['OnSiteAuditorModel'] as List<dynamic>?)
          ?.map((e) => OnSiteAuditorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['supplierCoordinators'] as List<dynamic>?)
          ?.map((e) =>
              SupplierCoordinatorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['plantName'] as String?,
    );

Map<String, dynamic> _$AuditModelToJson(AuditModel instance) =>
    <String, dynamic>{
      'id': instance.auditID,
      'requestDate': instance.reqDate,
      'auditStaus': instance.auditStatus,
      'auditName': instance.auditName,
      'auditNumber': instance.auditNumber,
      'auditType': instance.auditType,
      'supplierName': instance.suppliersName,
      'templateId': instance.templateID,
      'templateName': instance.templateName,
      'auditTypeName': instance.auditTypeName,
      'plantName': instance.plantName,
      'supplierCoordinators':
          instance.supplierCoordinators?.map((e) => e.toJson()).toList(),
      'OnSiteAuditorModel':
          instance.onsiteAuditor?.map((e) => e.toJson()).toList(),
    };
