// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../screens/comment/data/data_source/comment_remote_data_source.dart'
    as _i7;
import '../../screens/comment/data/repo/comment_repo_impl.dart' as _i9;
import '../../screens/comment/domain/repo/comment_repo.dart' as _i8;
import '../../screens/comment/presentation/blocs/comment/comment_bloc.dart'
    as _i4;
import '../../screens/home/data/data_source/home_remote_data_source.dart'
    as _i6;
import '../../screens/home/data/repo/home_repo_impl.dart' as _i11;
import '../../screens/home/domain/repo/home_repo.dart' as _i10;
import '../../screens/home/presentation/blocs/home/home_bloc.dart' as _i3;
import '../network/network_service.dart' as _i5;
import 'injection.dart' as _i12;

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
    gh.factory<_i3.HomeBloc>(() => registerModule.homeBloc);
    gh.factory<_i4.CommentBloc>(() => registerModule.commentBloc);
    gh.singleton<_i5.NetworkService>(() => _i5.NetworkService());
    gh.lazySingleton<_i6.HomeRemoteDataSource>(
        () => _i6.HomeRemoteDataSource(gh<_i5.NetworkService>()));
    gh.lazySingleton<_i7.CommentRemoteDataSource>(
        () => _i7.CommentRemoteDataSource(gh<_i5.NetworkService>()));
    gh.lazySingleton<_i8.CommentRepository>(
        () => _i9.CommentRepositoryImpl(gh<_i7.CommentRemoteDataSource>()));
    gh.lazySingleton<_i10.HomeRepository>(
        () => _i11.HomeRepositoryImpl(gh<_i6.HomeRemoteDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
