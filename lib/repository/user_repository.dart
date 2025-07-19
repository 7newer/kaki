import 'package:review01/model/user.dart';

abstract class UserRepository{
  Future<User> getUser();
}