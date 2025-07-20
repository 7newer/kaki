import 'package:review01/jsonholder_practice/dto/post_dto.dart';
import 'package:review01/jsonholder_practice/model/post.dart';

extension PostMapper on PostDto {
  Post toPost() {
    return Post(
      userId: userId as int ?? -1,
      id: id as int ?? -1,
      title: title ?? 'no title',
      body: body ?? 'no contents',
    );
  }
}
