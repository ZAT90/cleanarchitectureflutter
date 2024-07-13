import 'package:cleanarchitectureflutter/screens/home/models/response/post_response.dart';

abstract class HomeRepository {
  Future<List<PostResponse>> getPosts();
}
