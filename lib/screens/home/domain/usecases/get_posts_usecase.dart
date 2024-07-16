import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';

class GetPostsUseCase {
  final HomeRepository homeRepository;
  GetPostsUseCase(this.homeRepository);
  ResultFuture<List<PostResponse>> getPosts() => homeRepository.getPosts();
}
