import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';


@JsonSerializable()
class Profile {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'division')
  final String? division;
  @JsonKey(name: 'post')
  final String? post;


  const Profile({
    this.name,
    this.division,
    this.post,


  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  Profile copyWith({
    String? name,
    String? division,
    String? post,
  }) {
    return Profile(
      name: name ?? this.name,
      division: division ?? this.division,
      post: post ?? this.post,

    );
  }
}



