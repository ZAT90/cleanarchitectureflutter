import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/di/injection.dart';
import 'package:cleanarchitectureflutter/core/utils/nav_args.dart';
import 'package:cleanarchitectureflutter/screens/comment/presentation/blocs/comment/comment_bloc.dart';
import 'package:cleanarchitectureflutter/screens/comment/presentation/pages/comments_page.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: NavigationConstants.home,
  routes: [
    GoRoute(
      path: NavigationConstants.home,
      name: NavigationConstants.homeRoute,
      builder: (context, state) => BlocProvider<HomeBloc>(
        create: (_) => getIt<HomeBloc>(),
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: NavigationConstants.comment,
      name: NavigationConstants.commentRoute,
      builder: (context, state) {
        // Get postId from path parameter
        final postId =
            int.tryParse(
              state.pathParameters[NavigationConstants.postIdParam] ?? '',
            ) ??
            0;
        // Get post object from extra (optional, for performance)
        final commentNavArgs = state.extra as CommentNavArgs?;
        final post = commentNavArgs?.post;

        return BlocProvider<CommentBloc>(
          create: (_) =>
              getIt<CommentBloc>()
                ..add(CommentEvent.loadComments(postId: postId, post: post)),
          child: CommentsPage(commentNavArgs: CommentNavArgs(post: post)),
        );
      },
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
);
