import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';
import 'package:cleanarchitectureflutter/core/network/network_service.dart';
import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';
import 'package:cleanarchitectureflutter/core/utils/helpers.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
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
    final data = await handleNetworkResponse(netWorkResponse);
    logger.d('networkResponse get data: $data');
    List responseList = data;
    List<PostResponse> postList =
        responseList.map((res) => PostResponse.fromJson(res)).toList();
    return postList;
  }
}
