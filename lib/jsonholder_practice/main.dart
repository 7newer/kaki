// import 'package:review01/jsonholder_practice/data_source/remote/post_data_source.dart';
// import 'package:review01/jsonholder_practice/data_source/remote/post_data_source_impl.dart';
// import 'package:review01/jsonholder_practice/model/post.dart';
// import 'package:review01/jsonholder_practice/repository/post_repository.dart';
// import 'package:review01/jsonholder_practice/repository/post_repository_impl.dart';
//
//
// void main() async {
//   // 1. DataSource의 구현체를 생성합니다.
//   final PostDataSource dataSource = PostDataSourceImpl();
//
//   // 2. Repository의 구현체를 생성하며 DataSource를 주입합니다.
//   final PostRepository postRepository = PostRepositoryImpl(dataSource);
//
//   // 3. 모든 기능을 테스트합니다. (에러 발생에 대비해 try-catch 사용)
//   try {
//     print('--- 1. 모든 게시글 가져오기 ---');
//     final posts = await postRepository.getPosts();
//     print('가져온 게시글 수: ${posts.length}');
//     if (posts.isNotEmpty) {
//       print('첫 번째 게시글 제목: ${posts.first.title}');
//     }
//
//     print('\n--- 2. ID가 2인 게시글 가져오기 ---');
//     final post = await postRepository.getPost(2);
//     print('가져온 게시글: $post');
//
//     print('\n--- 3. 새 게시글 생성하기 ---');
//     // 생성할 때는 id를 0으로 보내도, 서버가 새로운 id를 부여해서 반환합니다.
//     final newPost = Post(userId: 1, id: 0, title: '새로운 제목', body: '새로운 내용');
//     final createdPost = await postRepository.createPost(newPost);
//     print('생성된 게시글: $createdPost');
//
//     print('\n--- 4. 게시글 전체 수정하기 (PUT) ---');
//     final updatedPostData = Post(userId: 1, id: 3, title: '수정된 제목', body: '수정된 내용');
//     final updatedPost = await postRepository.updatePost(3, updatedPostData);
//     print('수정된 게시글: $updatedPost');
//
//     print('\n--- 5. 게시글 일부 수정하기 (PATCH) ---');
//     final patchedPost = await postRepository.patchPost(4, {'title': '일부만 수정된 제목'});
//     print('일부 수정된 게시글: $patchedPost');
//
//     print('\n--- 6. 게시글 삭제하기 ---');
//     await postRepository.deletePost(5);
//     print('ID가 5인 게시글 삭제 완료.');
//
//   } catch (e) {
//     print('에러 발생: $e');
//   }
// }