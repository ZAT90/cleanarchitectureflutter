import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/repositories/home_repo.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/usecases/get_posts_usecase.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPostsUseCase getPostsUseCase;
  HomeBloc(this.getPostsUseCase) : super(const HomeState.initial()) {
    on<HomeEvent>((events, emit) async {
      await events.when(loadItems: () async {
        final posts = await getPostsUseCase.getPosts();
        posts.fold(
          (error) => logger.d('error api: $error'),
          (posts) => emit(HomeState.loadAllPosts(postList: posts)),
        );
        ;
      });
    });
  }
}
