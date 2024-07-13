import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/constants/ui_constants.dart';
import 'package:cleanarchitectureflutter/core/utils/helpers.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/home/models/response/post_response.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostResponse> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: UiConstants(context).screenHeight,
        width: UiConstants(context).screenWidth,
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (BuildContext context, HomeState state) {
            state.whenOrNull(
              loadAllPosts: (postList) {
                logger.d('postList in ui: ${postList!.length}');
                posts.addAll(postList);
              },
            );
          },
          builder: (context, state) {
            logger.d('state in builder: $state');
            return SingleChildScrollView(
              child: Column(
                children: [
                  posts.isEmpty
                      ? Text('this is empty')
                      : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(posts[index].title!),
                            );
                          }),
                  ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, NavigationConstants.comment),
                      child: Text('go to comment'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
