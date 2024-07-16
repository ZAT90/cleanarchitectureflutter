import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/network_service.dart';
import 'package:cleanarchitectureflutter/core/utils/helpers.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommentRemoteDataSource {
  final NetworkService networkService;
  CommentRemoteDataSource(this.networkService);
  Future<List<CommentResponse>> getComments(int postId) async {
    final netWorkResponse = await networkService.get(
      path:
          '${ApiConstants.postsEndpoint}/$postId/${ApiConstants.commentsEndpoint}',
    );
    logger.d('networkResponse get comments: $netWorkResponse');
    final data = await handleNetworkResponse(netWorkResponse);
    List responseList = data;
    List<CommentResponse> commentList =
        responseList.map((res) => CommentResponse.fromJson(res)).toList();
    return commentList;
  }
}
