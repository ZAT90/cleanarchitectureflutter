// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../screens/comment/data/data_sources/comment_remote_data_source.dart'
    as _i9;
import '../../screens/comment/data/repositories/comment_repo_impl.dart' as _i11;
import '../../screens/comment/domain/repositories/comment_repo.dart' as _i10;
import '../../screens/comment/domain/usecases/get_comments_usecase.dart' as _i4;
import '../../screens/comment/presentation/blocs/comment/comment_bloc.dart'
    as _i6;
import '../../screens/home/data/data_sources/home_remote_data_source.dart'
    as _i8;
import '../../screens/home/data/repositories/home_repo_impl.dart' as _i13;
import '../../screens/home/domain/repositories/home_repo.dart' as _i12;
import '../../screens/home/domain/usecases/get_posts_usecase.dart' as _i3;
import '../../screens/home/presentation/blocs/home/home_bloc.dart' as _i5;
import '../network/network_service.dart' as _i7;
import 'injection.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.GetPostsUseCase>(() => registerModule.getPostsUseCase);
    gh.factory<_i4.GetCommentsUseCase>(() => registerModule.getCommentsUseCase);
    gh.factory<_i5.HomeBloc>(() => registerModule.homeBloc);
    gh.factory<_i6.CommentBloc>(() => registerModule.commentBloc);
    gh.singleton<_i7.NetworkService>(() => _i7.NetworkService());
    gh.lazySingleton<_i8.HomeRemoteDataSource>(
        () => _i8.HomeRemoteDataSource(gh<_i7.NetworkService>()));
    gh.lazySingleton<_i9.CommentRemoteDataSource>(
        () => _i9.CommentRemoteDataSource(gh<_i7.NetworkService>()));
    gh.lazySingleton<_i10.CommentRepository>(
        () => _i11.CommentRepositoryImpl(gh<_i9.CommentRemoteDataSource>()));
    gh.lazySingleton<_i12.HomeRepository>(
        () => _i13.HomeRepositoryImpl(gh<_i8.HomeRemoteDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
