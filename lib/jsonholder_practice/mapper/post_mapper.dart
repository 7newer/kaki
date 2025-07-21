import 'package:review01/jsonholder_practice/dto/post_dto.dart';
import 'package:review01/jsonholder_practice/model/post.dart';

extension PostMapper on PostDto {
  Post toPost() {
    return Post(
      userId: (userId ?? -1).toInt(),
      id: (id ?? -1).toInt(),
      title: title ?? 'no title',
      body: body ?? 'no contents',
    );
  }
}
