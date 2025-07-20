import 'dart:convert';

import 'package:review01/jsonholder_practice/core/response.dart';
import 'package:review01/jsonholder_practice/data_source/remote/post_data_source.dart';
import 'package:http/http.dart' as http;

class PostDataSourceImpl implements PostDataSource {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<Response<Map<String, dynamic>>> createPost({
    required String title,
    required String body,
    required int userId,
  }) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Response<Map<String, dynamic>>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPosts() async {
    // http.get 요청 보내고 응답 받기
    final url = Uri.parse('$_baseUrl/posts');
    final response = await http.get(url);

    // 응답 body를 json으로 파싱하고 List<Map<String, dynamic>>로 변환
    final jsonList = jsonDecode(response.body) as List;
    // jsonList를 Map<String, dynamic>으로 변환
    // 최소한으로 다룰 수 있는 기본 구조(Map, List)**로 만드는 1차 가공까지를 책임
    final posts = jsonList.map((json) => json as Map<String, dynamic>).toList();
    // Response 객체 생성
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: posts,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost(
    int id,
    Map<String, dynamic> user,
  ) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
