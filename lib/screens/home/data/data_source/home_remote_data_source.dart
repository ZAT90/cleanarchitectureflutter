import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';
import 'package:cleanarchitectureflutter/core/network/network_service.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/home/models/response/post_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeRemoteDataSource {
  final NetworkService networkService;
  HomeRemoteDataSource(this.networkService);

  Future<List<PostResponse>> getPosts() async {
    final netWorkResponse = await networkService.get(
      path: ApiConstants.postsEndpoint,
    );
    //logger.d('networkResponse get posts: $netWorkResponse');
    return netWorkResponse.maybeWhen(
      ok: (response) {
      //  logger.d('response runtimeType: ${response.runtimeType}');
        List responseList = response;
        List<PostResponse> postList = responseList
            .map((res) => PostResponse.fromJson(res))
            .toList();
        return postList;
      },
      orElse: () => throw Exception('api error'),
      badRequest: (message) => throw Exception('api error $message'),
      noData: (message) => throw Exception('api error: $message'),
    );
  }
}
