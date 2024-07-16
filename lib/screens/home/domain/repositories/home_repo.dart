import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';

abstract class HomeRepository {
  ResultFuture<List<PostResponse>> getPosts();
}
