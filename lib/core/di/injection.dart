import 'package:cleanarchitectureflutter/core/di/injection.config.dart';
import 'package:cleanarchitectureflutter/core/network/auth_interceptor.dart';
import 'package:cleanarchitectureflutter/core/network/network_checker/network/network_bloc.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repositories/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/usecases/get_comments_usecase.dart';
import 'package:cleanarchitectureflutter/screens/comment/presentation/blocs/comment/comment_bloc.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/usecases/get_posts_usecase.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit(
  generateForDir: ['lib'],
  initializerName: 'init', // Specify the directory for generation
  preferRelativeImports: true,
  asExtension: true,
)
void setupInjection() => getIt.init();

@module
abstract class RegisterModule {
  // Register InternetConnection
  InternetConnection get internetConnection => InternetConnection();
  // Register NetworkBloc
  NetworkBloc get networkBloc => NetworkBloc(getIt<InternetConnection>());

  @factoryMethod
  // Register all use cases
  GetPostsUseCase get getPostsUseCase =>
      GetPostsUseCase(getIt<HomeRepository>());
  GetCommentsUseCase get getCommentsUseCase =>
      GetCommentsUseCase(getIt<CommentRepository>());
  // Register All Blocs as lazySingleton (reuses same instance)
  @lazySingleton
  HomeBloc get homeBloc => HomeBloc(getIt<GetPostsUseCase>());
  @lazySingleton
  CommentBloc get commentBloc => CommentBloc(getIt<GetCommentsUseCase>());
  // Register AuthInterceptor as lazySingleton
  @lazySingleton
  AuthInterceptor get authInterceptor => AuthInterceptor();
}
