/*
* Response<T>의 형태의 종속성을 가지고 있는 클래스
* Repository는 데이터가 어디서 오는지(API, DB, 파일 등) 몰라야 하기때문에 body를 jsonDeocode로 변환
* - 즉 Dart에서 바로 쓸수 있는 기본객체(Map,List)로 변환이 목적
* */

import 'dart:convert';

import 'package:review01/jsonholder_practice/core/response.dart';
import 'package:review01/jsonholder_practice/data_source/remote/post_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:review01/jsonholder_practice/dto/post_dto.dart';

class PostDataSourceImpl implements PostDataSource {
  // jsonplaceholder.typicode.com의 https- 신분증(SSL 인증서)을 제대로 확인하지 못해서 연결을 거부하고, 그 결과로 HTML 에러 페이지
  final _baseUrl = 'http://jsonplaceholder.typicode.com';

  http.Client _client;
  // test용이성을 위해서 http통신 기능클래스를 생성자로 주입받음
  PostDataSourceImpl({http.Client? client}) // named parameter, optional parameter
      : _client = client ?? http.Client();

  @override
  Future<Response<Map<String, dynamic>>> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': title, 'body': body, 'userId': userId}),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<void>> deletePost(int id) async {
    final response = await _client.delete(Uri.parse('$_baseUrl/posts/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) async {
    final response = await _client.get(Uri.parse('$_baseUrl/posts/$id'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPosts() async {
    // http.get 요청 보내고 응답 받기
    final url = Uri.parse('$_baseUrl/posts');
    final response = await _client.get(url);

    // 응답 body를 json으로 파싱하고 List<Map<String, dynamic>>로 변환
    final jsonList = jsonDecode(response.body) as List;
    // jsonList를 Map<String, dynamic>으로 변환
    // 최소한으로 다룰 수 있는 기본 구조(Map, List)로 만드는 1차 가공까지를 책임
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
    PostDto post,
  ) async {
    final response = await _client.put(
      Uri.parse('$_baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost(
    int id,
    Map<String, dynamic> patchData,
  ) async {
    // patch 요청 보내기
    final response = await _client.patch(
      Uri.parse('$_baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(patchData),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}
