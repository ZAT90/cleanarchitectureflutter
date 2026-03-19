import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:cleanarchitectureflutter/screens/home/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPostsUseCase getPostsUseCase;

  late final PagingController<int, PostResponse> postsPagingController;
  HomeBloc(this.getPostsUseCase) : super(const HomeState.initial()) {
    postsPagingController = _initPagingController();
    on<HomeEvent>((events, emit) async {
      await events.when(
        refreshList: () async {
          postsPagingController.refresh();
        },
      );
    });
  }
  // ==========================================
  // EXTRACTED PAGINATION LOGIC
  // ==========================================
  PagingController<int, PostResponse> _initPagingController() {
    return PagingController<int, PostResponse>(
      getNextPageKey: (state) {
        final lastPage = state.pages?.last;
        // If the last page has less than 10 items, we've reached the end
        if (lastPage != null && lastPage.length < 10) return null;

        // Otherwise, increment the page key
        return (state.keys?.last ?? 0) + 1;
      },
      fetchPage: (pageKey) async {
        final result = await getPostsUseCase.getPosts(page: pageKey);

        return switch (result) {
          Success(data: final items) => items,
          Failure(error: final apiError) => throw apiError,
        };
      },
    );
  }

  @override
  Future<void> close() {
    postsPagingController.dispose();
    return super.close();
  }

  // ==========================================
  // HOW TO CLEAR TOKEN ON LOGOUT
  // ==========================================
  // To clear the auth token on logout, call:
  // getIt<AuthInterceptor>().clearToken();
  //
  // Example usage in a logout event:
  // void logout() {
  //   getIt<AuthInterceptor>().clearToken();
  //   // Navigate to login screen
  // }
}
