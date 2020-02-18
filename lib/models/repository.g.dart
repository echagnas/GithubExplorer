// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    json['name'] as String,
    json['language'] as String,
    json['stargazers_count'] as int,
    json['description'] as String,
    json['html_url'] as String,
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'stargazers_count': instance.stargazers_count,
      'description': instance.description,
      'html_url': instance.html_url,
    };
