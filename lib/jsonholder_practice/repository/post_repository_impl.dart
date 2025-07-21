import 'package:review01/jsonholder_practice/core/response.dart';
import 'package:review01/jsonholder_practice/dto/post_dto.dart';
import 'package:review01/jsonholder_practice/mapper/post_mapper.dart';
import 'package:review01/jsonholder_practice/model/post.dart';
import 'package:review01/jsonholder_practice/repository/post_repository.dart';

import '../data_source/remote/post_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _dataSource;

  // 생성자 주입
  PostRepositoryImpl(this._dataSource);

  @override
  Future<Post> createPost(Post post) async {
    final postDto = PostDto(
      userId: post.userId,
      id: post.id,
      title: post.title,
      body: post.body,
    );

    final response = await _dataSource.createPost(
      title: postDto.title ?? '',
      body: postDto.body ?? '',
      userId: postDto.userId as int ?? 0,
    );
    return PostDto.fromJson(response.body).toPost();
  }

  @override
  Future<void> deletePost(int id) async {
    await _dataSource.deletePost(id);
  }

  @override
  Future<Post> getPost(int id) async {
    final response = await _dataSource.getPost(id);
    return PostDto.fromJson(response.body).toPost();
  }

  @override
  Future<List<Post>> getPosts() async{
    final reponse = await _dataSource.getPosts();
    return reponse.body.map((json) => PostDto.fromJson(json).toPost()).toList();
  }

  @override
  Future<Post> patchPost(int id, Map<String, dynamic> data) async {
    final response = await _dataSource.patchPost(id, data);
    return PostDto.fromJson(response.body).toPost();
  }

  @override
  Future<Post> updatePost(int id, Post post) async {
    PostDto postDto = PostDto(
      userId: post.userId,
      id: post.id,
      title: post.title,
      body: post.body,
    );

    final response = await _dataSource.updatePost(id, postDto);
    return PostDto.fromJson(response.body).toPost();
  }
}
