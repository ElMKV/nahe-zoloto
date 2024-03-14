// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeModel _$BarcodeModelFromJson(Map<String, dynamic> json) => BarcodeModel(
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      prices: (json['prices'] as List<dynamic>?)
              ?.map((e) => Prices.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brand: json['brand'] as String? ?? '',
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) => Properties.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BarcodeModelToJson(BarcodeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'prices': instance.prices,
      'brand': instance.brand,
      'properties': instance.properties,
    };

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      size: json['size'] as String? ?? '',
      price: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'size': instance.size,
      'price': instance.price,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      name: json['name'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
