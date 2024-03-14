import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'barcode.g.dart';


@JsonSerializable()
class BarcodeModel {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'prices')
  final List<Prices> prices;
  @JsonKey(name: 'brand')
  final String brand;
  @JsonKey(name: 'properties')
  final List<Properties> properties;


  const BarcodeModel({
    this.code = '',
    this.name = '',
    this.prices = const [],
    this.brand = '',
    this.properties = const [],



  });

  factory BarcodeModel.fromJson(Map<String, dynamic> json) =>
      _$BarcodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeModelToJson(this);

  BarcodeModel copyWith({
    String? code,
    String? name,
    List<Prices>? prices,
    String? brand,
    List<Properties>? properties,


  }) {
    return BarcodeModel(
      code: code ?? this.code,
      name: name ?? this.name,
      prices: prices ?? this.prices,
      brand: brand ?? this.brand,
      properties: properties ?? this.properties,

    );
  }
}

@JsonSerializable()
class Prices {
  @JsonKey(name: 'size')
  final String size;
  @JsonKey(name: 'price')
  final int price;



  const Prices({
    this.size = '',
    this.price = 0,


  });

  factory Prices.fromJson(Map<String, dynamic> json) =>
      _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);

  Prices copyWith({
    String? size,
    int? price,
  }) {
    return Prices(
      size: size ?? this.size,
      price: price ?? this.price,
    );
  }
}

@JsonSerializable()
class Properties {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'value')
  final String value;



  const Properties({
    this.name = '',
    this.value = '',
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);

  Properties copyWith({
    String? name,
    String? value,
  }) {
    return Properties(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}



