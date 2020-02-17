import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String login;
  String avatar_url;
  String name;
  String repos_url;
  int id;

  Profile(this.login, this.avatar_url, this.name, this.repos_url, this.id);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
