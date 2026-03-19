import 'package:cleanarchitectureflutter/core/constants/ui_constants.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/core/utils/nav_args.dart';
import 'package:cleanarchitectureflutter/screens/comment/presentation/blocs/comment/comment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatefulWidget {
  final CommentNavArgs commentNavArgs;
  const CommentsPage({super.key, required this.commentNavArgs});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {
          state.whenOrNull(
            getCommentsAndPost: (post, comments) {
              logger.d('post in comment page : $post');
              logger.d('comments in comment page : $comments');
            },
          );
        },
        listenWhen: (previous, current) => current.maybeWhen(
          getCommentsAndPost: (post, comments) => true,
          orElse: () => false,
        ),
        buildWhen: (previous, current) => current.maybeWhen(
          initial: () => true,
          getCommentsAndPost: (post, comments) => true,
          loadInProgress: () => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial')),
            loadInProgress: () =>
                const Center(child: CircularProgressIndicator()),
            getCommentsAndPost: (post, comments) => SizedBox(
              width: UiConstants(context).screenWidth,
              height: UiConstants(context).screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post?.title ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post?.body ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  // Comments Section
                  Expanded(
                    child: comments?.isEmpty ?? true
                        ? const Center(child: Text('No comments'))
                        : ListView.builder(
                            itemCount: comments?.length ?? 0,
                            itemBuilder: (context, index) {
                              final comment = comments![index];
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.name ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        comment.email ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        comment.body ?? '',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
