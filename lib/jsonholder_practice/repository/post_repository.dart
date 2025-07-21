import 'package:review01/jsonholder_practice/model/post.dart';

abstract interface class PostRepository{
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
  Future<Post> updatePost(int id, Post post);
  Future<Post> createPost(Post post);
  Future<void> deletePost(int id);
  // 수정데이터만 map형태로
  Future<Post> patchPost(int id, Map<String, dynamic> data);
}