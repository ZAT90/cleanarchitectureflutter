import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/di/injection.dart';
import 'package:cleanarchitectureflutter/core/routes/generated_routes.dart';
import 'package:cleanarchitectureflutter/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupInjection();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: NavigationConstants.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
