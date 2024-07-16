import 'package:cleanarchitectureflutter/core/di/injection.config.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repositories/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/usecases/get_comments_usecase.dart';
import 'package:cleanarchitectureflutter/screens/comment/presentation/blocs/comment/comment_bloc.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/usecases/get_posts_usecase.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit(
    generateForDir: ['lib'],
    initializerName: 'init', // Specify the directory for generation
    preferRelativeImports: true,
    asExtension: true)
void setupInjection() => getIt.init();

@module
abstract class RegisterModule {
  // @lazySingleton
 
  @factoryMethod
  // Register all use cases
  GetPostsUseCase get getPostsUseCase =>
      GetPostsUseCase(getIt<HomeRepository>());
  GetCommentsUseCase get getCommentsUseCase =>
      GetCommentsUseCase(getIt<CommentRepository>());
   // Register All Blocs
  HomeBloc get homeBloc => HomeBloc(
        getIt<GetPostsUseCase>(),
      );
  CommentBloc get commentBloc => CommentBloc(
        getIt<GetCommentsUseCase>(),
      );
}
