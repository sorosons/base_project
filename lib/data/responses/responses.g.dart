// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..status = json['status'] as int?
    ..message = json['message'] as String?
    ..success = json['success'] as bool?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'success': instance.success,
    };

MemeResponse _$MemeResponseFromJson(Map<String, dynamic> json) {
  return MemeResponse(
    json['id'] as String?,
    json['name'] as String?,
    json['url'] as String?,
    json['width'] as int?,
    json['height'] as int?,
    json['box_count'] as int?,
  );
}

Map<String, dynamic> _$MemeResponseToJson(MemeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'box_count': instance.boxCount,
    };

MemeDataResponse _$MemeDataResponseFromJson(Map<String, dynamic> json) {
  return MemeDataResponse(
    (json['memes'] as List<dynamic>?)
        ?.map((e) => MemeResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MemeDataResponseToJson(MemeDataResponse instance) =>
    <String, dynamic>{
      'memes': instance.meme,
    };

MemeHomeResponse _$MemeHomeResponseFromJson(Map<String, dynamic> json) {
  return MemeHomeResponse(
    json['data'] == null
        ? null
        : MemeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int?
    ..message = json['message'] as String?
    ..success = json['success'] as bool?;
}

Map<String, dynamic> _$MemeHomeResponseToJson(MemeHomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'success': instance.success,
      'data': instance.memeDataResponse,
    };
