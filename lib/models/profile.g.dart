// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['login'] as String,
    json['avatar_url'] as String,
    json['name'] as String,
    json['repos_url'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatar_url,
      'name': instance.name,
      'repos_url': instance.repos_url,
      'id': instance.id,
    };
