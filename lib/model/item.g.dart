// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Item _$ItemFromJson(Map<String, dynamic> json) =>
    _Item(name: json['name'] as String, price: (json['price'] as num).toInt());

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
};
