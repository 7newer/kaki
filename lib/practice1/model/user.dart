import 'package:freezed_annotation/freezed_annotation.dart';

import '../dto/user_dto.dart';
import 'item.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String username,
    required int age,
    required Address address,
    required List<Item> itemsPurchased,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}