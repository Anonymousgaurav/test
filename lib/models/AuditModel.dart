import 'package:json_annotation/json_annotation.dart';

import 'BaseModel.dart';
import 'OnSiteAuditorModel.dart';
import 'SupplierCoordinatorsModel.dart';

part 'AuditModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AuditModel extends BaseModel {
  @JsonKey(name: "id")
  int? auditID;
  @JsonKey(name: "requestDate")
  String? reqDate;
  @JsonKey(name: "auditStaus")
  String? auditStatus;
  @JsonKey(name: "auditName")
  String? auditName;
  @JsonKey(name: "auditNumber")
  String? auditNumber;
  @JsonKey(name: "auditType")
  String? auditType;
  @JsonKey(name: "supplierName")
  String? suppliersName;
  @JsonKey(name: "templateId")
  int? templateID;
  @JsonKey(name: "templateName")
  String? templateName;
  @JsonKey(name: "auditTypeName")
  String? auditTypeName;
  @JsonKey(name: "plantName")
  String? plantName;
  @JsonKey(name: "supplierCoordinators")
  List<SupplierCoordinatorsModel>? supplierCoordinators;
  @JsonKey(name: "OnSiteAuditorModel")
  List<OnSiteAuditorModel>? onsiteAuditor;

  AuditModel(
      this.auditID,
      this.reqDate,
      this.auditStatus,
      this.auditName,
      this.auditNumber,
      this.auditType,
      this.suppliersName,
      this.templateID,
      this.templateName,
      this.auditTypeName,
      this.onsiteAuditor,
      this.supplierCoordinators,
      this.plantName)
      : super();

  factory AuditModel.fromJson(Map<String, dynamic> json) =>
      _$AuditModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuditModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': auditID,
      'requestDate': reqDate,
      'auditStaus': auditStatus,
      'auditName': auditName,
      'auditNumber': auditNumber,
      'plantName': plantName,
      'templateName': templateName,
    };
  }
}
