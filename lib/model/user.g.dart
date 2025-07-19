// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  username: json['username'] as String,
  age: (json['age'] as num).toInt(),
  address: Address.fromJson(json['address']),
  itemsPurchased: (json['itemsPurchased'] as List<dynamic>)
      .map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'username': instance.username,
  'age': instance.age,
  'address': instance.address,
  'itemsPurchased': instance.itemsPurchased,
};
