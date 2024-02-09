import 'package:json_annotation/json_annotation.dart';

import 'BaseModel.dart';

part 'OnSiteAuditorModel.g.dart';

@JsonSerializable(explicitToJson: true)
class OnSiteAuditorModel extends BaseModel {
  @JsonKey(name: "userId")
  int? userID;
  @JsonKey(name: "name")
  String? name;

  OnSiteAuditorModel(this.userID, this.name) : super();

  factory OnSiteAuditorModel.fromJson(Map<String, dynamic> json) =>
      _$OnSiteAuditorModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnSiteAuditorModelToJson(this);
}
