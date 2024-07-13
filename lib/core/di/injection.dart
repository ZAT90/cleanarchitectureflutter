import 'package:cleanarchitectureflutter/core/di/injection.config.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repo/home_repo.dart';
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
  // HomeRepository get homeRepository => getIt<HomeRepository>();
  @factoryMethod
  HomeBloc get homeBloc => HomeBloc(
        getIt<HomeRepository>(),
      );
}
