import 'package:review01/jsonholder_practice/core/response.dart';
import 'package:review01/jsonholder_practice/dto/post_dto.dart';

abstract interface class PostDataSource {
  // 모든 글 가져오기
  Future<Response<List<Map<String, dynamic>>>> getPosts();

  // 한개 글 가져오기
  Future<Response<Map<String, dynamic>>> getPost(int id);

  // 새 글 생성하기
  //Future<Response<Map<String, dynamic>>> createPost(Map<String, dynamic> user);
  Future<Response<Map<String, dynamic>>> createPost({
    required String title,
    required String body,
    required int userId,
  });

  // 글 수정하기
  Future<Response<Map<String, dynamic>>> updatePost(int id, PostDto patchData);

  // 글 삭제하기
  Future<Response<void>> deletePost(int id);

  Future<Response<Map<String, dynamic>>> patchPost(
    int id,
    Map<String, dynamic> post,
  );
}
