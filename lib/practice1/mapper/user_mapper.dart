import 'package:review01/practice1/dto/user_dto.dart';

import '../model/item.dart';
import '../model/user.dart';

extension UserMapper on UserDto {
  User toModel() {
    final safeName = userName ?? 'Unknown';

    int safeAge;
    if (age is String) {
      safeAge = int.tryParse(age as String) ?? 0;
    } else if (age is num) {
      safeAge = age!.toInt();
    } else {
      safeAge = 0;
    }

    final safeAddress = address ?? Address(city: 'Unknown', street: 'Unknown');
    final safeItems =
        itemsPurchased?.map((dto) {
          int itemPrice;
          if (dto.price is String) {
            itemPrice = int.tryParse(dto.price as String) ?? 0;
          } else if (dto.price is num) {
            itemPrice = dto.price!.toInt();
          } else {
            itemPrice = 0;
          }
          return Item(name: dto.itemName ?? 'Unknown', price: itemPrice);
        }).toList() ??
        [];

    return User(
      username: safeName,
      age: safeAge,
      address: safeAddress,
      itemsPurchased: safeItems,
    );
  }
}
