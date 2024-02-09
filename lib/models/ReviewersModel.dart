import 'package:json_annotation/json_annotation.dart';

import 'BaseModel.dart';

part 'ReviewersModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewersModel extends BaseModel {
  @JsonKey(name: "userId")
  int? userID;
  @JsonKey(name: "name")
  String? name;

  ReviewersModel(this.userID, this.name) : super();

  factory ReviewersModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewersModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewersModelToJson(this);
}
