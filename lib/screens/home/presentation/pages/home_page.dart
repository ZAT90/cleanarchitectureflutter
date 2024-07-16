import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/constants/ui_constants.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/core/utils/nav_args.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:cleanarchitectureflutter/screens/home/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<PostResponse> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: UiConstants(context).screenHeight,
        width: UiConstants(context).screenWidth,
        child: BlocBuilder<HomeBloc, HomeState>(
          
          builder: (context, state) {
            // logger.d('state in builder: $state');
            return SingleChildScrollView(
                child: state.whenOrNull(
              initial: () => const Center(child: CircularProgressIndicator()),
              loadAllPosts: (postList) {
                return postListView(postList);
              },
            ));
          },
        ),
      ),
    );
  }

  Widget postListView(List<PostResponse>? postList) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: postList!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            onTap: () => Navigator.pushNamed(
                context, NavigationConstants.comment,
                arguments: CommentNavArgs(post: postList[index])),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.black)),
            title: Text(postList[index].title!),
            subtitle: Text(
              postList[index].body!,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_right_alt_sharp)),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 5,
        );
      },
    );
  }
}
