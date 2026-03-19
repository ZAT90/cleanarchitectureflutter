import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';

class GetPostsUseCase {
  final HomeRepository homeRepository;
  GetPostsUseCase(this.homeRepository);
  ResultFuture<List<PostResponse>> getPosts({required int page}) =>
      homeRepository.getPosts(page: page);
}
