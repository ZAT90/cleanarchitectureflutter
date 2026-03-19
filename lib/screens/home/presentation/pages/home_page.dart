import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/utils/nav_args.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    // Grab the bloc once in initState
    _homeBloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      // 1. Listen for standard Bloc states (like error Snackbars)
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          // Handle your actionSuccess / actionFailure here if needed
        },

        // 2. The PagingListener connects the UI to the controller in the Bloc
        child: PagingListener<int, PostResponse>(
          controller: _homeBloc.postsPagingController,

          // It exposes the current state and the fetchNextPage callback
          builder: (context, state, fetchNextPage) {
            return RefreshIndicator(
              onRefresh: () async {
                // Refresh the controller directly here
                _homeBloc.postsPagingController.refresh();
                await Future.delayed(const Duration(milliseconds: 500));
              },

              // 3. PagedListView explicitly takes the state and callback
              child: PagedListView<int, PostResponse>.separated(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate<PostResponse>(
                  itemBuilder: (context, post, index) {
                    return ListTile(
                      title: Text(post.title ?? 'No Title'),
                      subtitle: Text(
                        post.body ?? 'No Content',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        // Navigate to comments using GoRouter
                        // postId from path parameter, post object from extra
                        context.pushNamed(
                          NavigationConstants.commentRoute,
                          pathParameters: {
                            NavigationConstants.postIdParam: '${post.id}',
                          },
                          extra: CommentNavArgs(post: post),
                        );
                      },
                    );
                  },

                  // Optional: Customize your loading indicators
                  firstPageProgressIndicatorBuilder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  newPageProgressIndicatorBuilder: (_) => const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  noItemsFoundIndicatorBuilder: (_) =>
                      const Center(child: Text('No posts found.')),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            );
          },
        ),
      ),
    );
  }
}
