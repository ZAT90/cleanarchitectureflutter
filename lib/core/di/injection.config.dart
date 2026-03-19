// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i3;

import '../../screens/comment/data/data_sources/comment_remote_data_source.dart'
    as _i12;
import '../../screens/comment/data/repositories/comment_repo_impl.dart' as _i14;
import '../../screens/comment/domain/repositories/comment_repo.dart' as _i13;
import '../../screens/comment/domain/usecases/get_comments_usecase.dart' as _i6;
import '../../screens/comment/presentation/blocs/comment/comment_bloc.dart'
    as _i8;
import '../../screens/home/data/data_sources/home_remote_data_source.dart'
    as _i11;
import '../../screens/home/data/repositories/home_repo_impl.dart' as _i16;
import '../../screens/home/domain/repositories/home_repo.dart' as _i15;
import '../../screens/home/domain/usecases/get_posts_usecase.dart' as _i5;
import '../../screens/home/presentation/blocs/home/home_bloc.dart' as _i7;
import '../network/auth_interceptor.dart' as _i9;
import '../network/network_checker/network/network_bloc.dart' as _i4;
import '../network/network_service.dart' as _i10;
import 'injection.dart' as _i17;

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
    gh.factory<_i3.InternetConnection>(() => registerModule.internetConnection);
    gh.factory<_i4.NetworkBloc>(() => registerModule.networkBloc);
    gh.factory<_i5.GetPostsUseCase>(() => registerModule.getPostsUseCase);
    gh.factory<_i6.GetCommentsUseCase>(() => registerModule.getCommentsUseCase);
    gh.lazySingleton<_i7.HomeBloc>(() => registerModule.homeBloc);
    gh.lazySingleton<_i8.CommentBloc>(() => registerModule.commentBloc);
    gh.lazySingleton<_i9.AuthInterceptor>(() => registerModule.authInterceptor);
    gh.lazySingleton<_i10.NetworkService>(() => _i10.NetworkService());
    gh.lazySingleton<_i11.HomeRemoteDataSource>(
        () => _i11.HomeRemoteDataSource(gh<_i10.NetworkService>()));
    gh.lazySingleton<_i12.CommentRemoteDataSource>(
        () => _i12.CommentRemoteDataSource(gh<_i10.NetworkService>()));
    gh.lazySingleton<_i13.CommentRepository>(
        () => _i14.CommentRepositoryImpl(gh<_i12.CommentRemoteDataSource>()));
    gh.lazySingleton<_i15.HomeRepository>(
        () => _i16.HomeRepositoryImpl(gh<_i11.HomeRemoteDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
