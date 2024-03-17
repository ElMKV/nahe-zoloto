// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapModel _$MapModelFromJson(Map<String, dynamic> json) => MapModel(
      name: json['name'] as String? ?? '',
      stores: (json['stores'] as List<dynamic>?)
              ?.map((e) => Stores.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MapModelToJson(MapModel instance) => <String, dynamic>{
      'name': instance.name,
      'stores': instance.stores,
    };

Stores _$StoresFromJson(Map<String, dynamic> json) => Stores(
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      lat: json['lat'] as String? ?? '',
      long: json['long'] as String? ?? '',
    );

Map<String, dynamic> _$StoresToJson(Stores instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'long': instance.long,
    };
