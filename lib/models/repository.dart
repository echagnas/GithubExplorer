import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  String name;
  String language;
  int stargazers_count;
  String description;
  String html_url;

  Repository(this.name, this.language, this.stargazers_count, this.description,
      this.html_url);

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
