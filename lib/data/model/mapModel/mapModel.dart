import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'mapModel.g.dart';


@JsonSerializable()
class MapModel {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'stores')
  final List<Stores> stores;


  const MapModel({
    this.name = '',
    this.stores = const [],
  });

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapModelToJson(this);

  MapModel copyWith({
    String? name,
    List<Stores>? stores,


  }) {
    return MapModel(
      name: name ?? this.name,
      stores: stores ?? this.stores,
    );
  }
}

@JsonSerializable()
class Stores {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'lat')
  final String lat;
  @JsonKey(name: 'long')
  final String long;



  const Stores({
    this.name = '',
    this.address = '',
    this.lat = '',
    this.long = '',
  });

  factory Stores.fromJson(Map<String, dynamic> json) =>
      _$StoresFromJson(json);

  Map<String, dynamic> toJson() => _$StoresToJson(this);

  Stores copyWith({
    String? name,
    String? address,
    String? lat,
    String? long,


  }) {
    return Stores(
      name: name ?? this.name,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }
}




