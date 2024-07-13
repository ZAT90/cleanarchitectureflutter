import 'package:cleanarchitectureflutter/screens/home/data/data_source/home_remote_data_source.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repo/home_repo.dart';
import 'package:cleanarchitectureflutter/screens/home/models/response/post_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository{
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  Future<List<PostResponse>> getPosts() async{
   return await homeRemoteDataSource.getPosts();
  }

}