import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';
import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/home/data/data_sources/home_remote_data_source.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  ResultFuture<List<PostResponse>> getPosts() async {
    try {
      return Right(await homeRemoteDataSource.getPosts());
    } on ApiErrorMessage catch (ex) {
      return Left(ApiErrorMessage(errorMessage: ex.errorMessage));
    }
  }
}
