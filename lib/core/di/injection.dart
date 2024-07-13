import 'package:cleanarchitectureflutter/core/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit(
    generateForDir: ['test'],
    initializerName: 'init', // Specify the directory for generation
    preferRelativeImports: true,
    asExtension: true)
void setupInjection() => getIt.init();
