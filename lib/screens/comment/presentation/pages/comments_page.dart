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
          // TODO: implement listener
          state.whenOrNull(
            getCommentsAndPost: (post, comments) {
              logger.d('post in comment page : $post');
              logger.d('comments in comment page : $comments');
            },
          );
        },
        builder: (context, state) {
          return SizedBox(
            width: UiConstants(context).screenWidth,
            height: UiConstants(context).screenHeight,
            child: Text('comments page load'),
          );
        },
      ),
    );
  }
}
