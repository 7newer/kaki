class UserDto {
  UserDto({this.userName, this.age, this.address, this.itemsPurchased});

  UserDto.fromJson(dynamic json) {
    userName = json['user_name'];
    age = json['age'];
    address = json['address'] != null
        ? Address.fromJson(json['address'])
        : null;
    if (json['items_purchased'] != null) {
      itemsPurchased = [];
      json['items_purchased'].forEach((v) {
        if (v != null){
          itemsPurchased?.add(ItemsPurchased.fromJson(v));
        }
      });
    }
  }

  String? userName;
  num? age;
  Address? address;
  List<ItemsPurchased>? itemsPurchased;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = userName;
    map['age'] = age;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    if (itemsPurchased != null) {
      map['items_purchased'] = itemsPurchased?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ItemsPurchased {
  ItemsPurchased({this.itemName, this.price});

  ItemsPurchased.fromJson(dynamic json) {
    itemName = json['item_name'];
    price = json['price'];
  }

  String? itemName;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_name'] = itemName;
    map['price'] = price;
    return map;
  }
}

class Address {
  Address({this.city, this.street});

  Address.fromJson(dynamic json) {
    city = json['city'];
    street = json['street'];
  }

  String? city;
  String? street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['street'] = street;
    return map;
  }
}
