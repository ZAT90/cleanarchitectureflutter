import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/network_service.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/comment/models/response/comment_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommentRemoteDataSource {
  final NetworkService networkService;
  CommentRemoteDataSource(this.networkService);
  Future<List<CommentResponse>> getComments(int postId) async {
    final netWorkResponse = await networkService.get(
      path: '${ApiConstants.postsEndpoint}/$postId/${ApiConstants.commentsEndpoint}',
    );
    logger.d('networkResponse get comments: $netWorkResponse');
    return netWorkResponse.maybeWhen(
      ok: (response) {
        //  logger.d('response runtimeType: ${response.runtimeType}');
        List responseList = response;
        List<CommentResponse> commentList =
            responseList.map((res) => CommentResponse.fromJson(res)).toList();
        return commentList;
      },
      orElse: () => throw Exception('api error'),
      badRequest: (message) => throw Exception('api error $message'),
      noData: (message) => throw Exception('api error: $message'),
    );
  }
}
