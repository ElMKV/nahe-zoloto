import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';


@JsonSerializable()
class Auth {
  @JsonKey(name: 'token')
  final String token;


  const Auth({
    this.token = '',


  });

  factory Auth.fromJson(Map<String, dynamic> json) =>
      _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  Auth copyWith({
    String? token,
  }) {
    return Auth(
      token: token ?? this.token,

    );
  }
}



