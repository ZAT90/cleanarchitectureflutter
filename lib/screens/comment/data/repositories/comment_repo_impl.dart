import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';
import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/data_sources/comment_remote_data_source.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repositories/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CommentRepository)
class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource commentRemoteDataSource;
  CommentRepositoryImpl(this.commentRemoteDataSource);
  @override
  ResultFuture<List<CommentResponse>> getComments(int postId) async {
    try {
      return Right(await commentRemoteDataSource.getComments(postId));
    } on ApiErrorMessage catch (ex) {
      return Left(ApiErrorMessage(errorMessage: ex.errorMessage));
    }
  }
}
