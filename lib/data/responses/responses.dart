import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "success")
  bool? success;
}

@JsonSerializable()
class MemeResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "box_count")
  int? boxCount;

  MemeResponse(
      this.id, this.name, this.url, this.width, this.height, this.boxCount);

  //to  Json
  Map<String, dynamic> toJson() => _$MemeResponseToJson(this);

  //fromJson
  factory MemeResponse.fromJson(Map<String, dynamic> json) =>
      _$MemeResponseFromJson(json);
}

@JsonSerializable()
class MemeDataResponse {
  @JsonKey(name: 'memes')
  List<MemeResponse>? meme;

  MemeDataResponse(this.meme);

// toJson
  Map<String, dynamic> toJson() => _$MemeDataResponseToJson(this);

//fromJson
  factory MemeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MemeDataResponseFromJson(json);
}

@JsonSerializable()
class MemeHomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  MemeDataResponse? memeDataResponse;
  MemeHomeResponse(this.memeDataResponse);

// toJson
  Map<String, dynamic> toJson() => _$MemeHomeResponseToJson(this);

//fromJson
  factory MemeHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$MemeHomeResponseFromJson(json);
}
