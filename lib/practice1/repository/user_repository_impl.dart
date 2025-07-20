import 'dart:convert';

import 'package:review01/practice1/mapper/user_mapper.dart';
import 'package:review01/practice1/model/user.dart';
import 'package:review01/practice1/repository/user_repository.dart';

import '../dto/user_dto.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser() async {
    final _api = FakeUserApi();
    final jsonString = _api.fetchUnstableUserData();
    final json = jsonDecode(jsonString);
    final userDto = UserDto.fromJson(json);
    final user = userDto.toModel();
    return user;
  }
}

// 서버 API를 흉내 내는 가짜 클래스
class FakeUserApi {
  String fetchUnstableUserData() {
    return '''
      {
        "user_name": "Jane Doe",
        "age": "32",
        "address": {"city": "Busan", "street": "Haeundae"},
        "items_purchased": [
          {"item_name": "book", "price": 15000},
          null,
          {"item_name": null, "price": 30000},
          {"item_name": "keyboard", "price": "invalid_price"},
          {"item_name": "mouse"}
        ]
      }
    ''';
  }
}
