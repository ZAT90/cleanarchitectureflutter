import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/di/injection.dart';
import 'package:cleanarchitectureflutter/screens/comment/presentation/pages/comments_page.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<HomeBloc>(
                  create: (context) => getIt<HomeBloc>()..add(const HomeEvent.loadItems()),
                  child: HomePage(),
                ));
      case NavigationConstants.comment:
        return MaterialPageRoute(builder: (_) => CommentsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
