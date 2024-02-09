import 'package:json_annotation/json_annotation.dart';

import 'BaseModel.dart';

part 'SupplierCoordinatorsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class SupplierCoordinatorsModel extends BaseModel {
  @JsonKey(name: "userId")
  int? userID;
  @JsonKey(name: "name")
  String? suppliersName;

  SupplierCoordinatorsModel(this.userID, this.suppliersName) : super();

  factory SupplierCoordinatorsModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierCoordinatorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierCoordinatorsModelToJson(this);
}
