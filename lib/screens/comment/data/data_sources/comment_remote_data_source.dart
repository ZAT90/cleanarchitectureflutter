import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/network_response.dart';
import 'package:cleanarchitectureflutter/core/network/network_service2.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommentRemoteDataSource {
  final NetworkService networkService;
  CommentRemoteDataSource(this.networkService);
  Future<List<CommentResponse>> getComments(int postId) async {
    final netWorkResponse = await networkService.get<List<CommentResponse>>(
      path:
          '${ApiConstants.postsEndpoint}/$postId/${ApiConstants.commentsEndpoint}',
      parser: (json) =>
          (json as List).map((item) => CommentResponse.fromJson(item)).toList(),
    );
    logger.d('networkResponse get comments: $netWorkResponse');

    return netWorkResponse.getOrThrow();
  }
}
