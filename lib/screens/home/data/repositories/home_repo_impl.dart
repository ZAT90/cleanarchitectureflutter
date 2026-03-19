import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';
import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/home/data/data_sources/home_remote_data_source.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  ResultFuture<List<PostResponse>> getPosts({required int page}) async {
    try {
      return Success(await homeRemoteDataSource.getPosts(page: page));
    } on ApiErrorMessage catch (e) {
      // 3. Catch the specific error thrown by .getOrThrow()
      return Failure(e);
    } catch (e) {
      // 4. Catch any other unexpected errors (like mapping crashes)
      return Failure(ApiErrorMessage(errorMessage: e.toString()));
    }
  }
}
