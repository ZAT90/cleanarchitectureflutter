import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/network_response.dart';
import 'package:cleanarchitectureflutter/core/network/network_service.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeRemoteDataSource {
  final NetworkService networkService;
  HomeRemoteDataSource(this.networkService);

  Future<List<PostResponse>> getPosts(
      {required int page, int limit = 10}) async {
    final netWorkResponse = await networkService.get<List<PostResponse>>(
      path: ApiConstants.postsEndpoint,
      queryParams: {'_page': page, '_limit': limit},
      parser: (json) =>
          (json as List).map((item) => PostResponse.fromJson(item)).toList(),
    );
    return netWorkResponse.getOrThrow();
  }
}
