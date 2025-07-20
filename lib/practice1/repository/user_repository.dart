import 'package:review01/practice1/model/user.dart';

abstract class UserRepository{
  Future<User> getUser();
}