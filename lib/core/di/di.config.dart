// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/authentication/data/repository/auth_repository_impl.dart'
    as _i233;
import '../../features/authentication/data/repository/data_sources/auth_remote_data_source.dart'
    as _i633;
import '../../features/authentication/data/repository/data_sources/auth_remote_data_source_impl.dart'
    as _i115;
import '../../features/authentication/domain/repository/auth_repository.dart'
    as _i170;
import '../../features/authentication/domain/usecases/login_usecase.dart'
    as _i995;
import '../../features/authentication/domain/usecases/register_usecase.dart'
    as _i257;
import '../../features/authentication/ui/screens/login/cubit/login_cubit.dart'
    as _i333;
import '../../features/authentication/ui/screens/register/cubit/register_cubit.dart'
    as _i712;
import '../../features/cart/data/mapper/cart_mapper.dart' as _i817;
import '../../features/cart/data/repository/cart_repository_impl.dart'
    as _i1063;
import '../../features/cart/data/repository/data_source/cart_remote_data_source.dart'
    as _i747;
import '../../features/cart/data/repository/data_source/cart_remote_data_source_impl.dart'
    as _i950;
import '../../features/cart/domain/repository/cart_repository.dart' as _i26;
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart' as _i659;
import '../../features/cart/domain/usecases/get_cart_usecase.dart' as _i179;
import '../../features/cart/domain/usecases/remove_from_cart_usecase.dart'
    as _i355;
import '../../features/cart/domain/usecases/update_cart_qty_usecase.dart'
    as _i380;
import '../../features/cart/ui/cubit/cart_cubit.dart' as _i779;
import '../../features/commerce/data/mappers/category_mapper.dart' as _i360;
import '../../features/commerce/data/mappers/product_mapper.dart' as _i417;
import '../../features/commerce/data/mappers/sub_category_mapper.dart'
    as _i1017;
import '../../features/commerce/data/repository/home_repository/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i562;
import '../../features/commerce/data/repository/home_repository/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i699;
import '../../features/commerce/data/repository/home_repository/home_repository_impl.dart'
    as _i386;
import '../../features/commerce/domain/repository/home_repository.dart'
    as _i457;
import '../../features/commerce/domain/usecase/get_categories_usecase.dart'
    as _i159;
import '../../features/commerce/domain/usecase/get_products_usecase.dart'
    as _i582;
import '../../features/commerce/domain/usecase/get_sub_categories_usecase.dart'
    as _i778;
import '../../features/commerce/ui/screens/products/cubit/products_cubit.dart'
    as _i268;
import '../../features/commerce/ui/screens/tabs/category/cubit/category_cubit.dart'
    as _i335;
import '../../features/commerce/ui/screens/tabs/home/cubit/home_cubit.dart'
    as _i334;
import '../../features/network/api/api_services.dart' as _i392;
import '../shared_pref_utils/shared_pref_utils.dart' as _i420;
import 'network_module.dart' as _i567;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i360.CategoryMapper>(() => _i360.CategoryMapper());
    gh.factory<_i417.ProductMapper>(() => _i417.ProductMapper());
    gh.factory<_i1017.SubCategoryMapper>(() => _i1017.SubCategoryMapper());
    gh.singleton<_i420.SharedPrefUtils>(() => _i420.SharedPrefUtils());
    gh.factory<_i392.ApiServices>(() => _i392.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i817.CartMapper>(
      () => _i817.CartMapper(gh<_i417.ProductMapper>()),
    );
    gh.factory<_i633.AuthRemoteDataSource>(
      () => _i115.AuthRemoteDataSourceImpl(gh<_i392.ApiServices>()),
    );
    gh.factory<_i747.CartRemoteDataSource>(
      () => _i950.CartRemoteDataSourceImpl(gh<_i392.ApiServices>()),
    );
    gh.factory<_i562.HomeRemoteDataSource>(
      () => _i699.HomeRemoteDataSourceImpl(gh<_i392.ApiServices>()),
    );
    gh.factory<_i170.AuthRepository>(
      () => _i233.AuthRepositoryImpl(
        gh<_i633.AuthRemoteDataSource>(),
        gh<_i420.SharedPrefUtils>(),
      ),
    );
    gh.factory<_i457.HomeRepository>(
      () => _i386.HomeRepositoryImpl(
        gh<_i562.HomeRemoteDataSource>(),
        gh<_i360.CategoryMapper>(),
        gh<_i417.ProductMapper>(),
        gh<_i1017.SubCategoryMapper>(),
      ),
    );
    gh.factory<_i159.GetCategoriesUseCase>(
      () => _i159.GetCategoriesUseCase(gh<_i457.HomeRepository>()),
    );
    gh.factory<_i582.GetProductsUseCase>(
      () => _i582.GetProductsUseCase(gh<_i457.HomeRepository>()),
    );
    gh.factory<_i778.GetSubCategoriesUseCase>(
      () => _i778.GetSubCategoriesUseCase(gh<_i457.HomeRepository>()),
    );
    gh.factory<_i335.CategoryCubit>(
      () => _i335.CategoryCubit(
        gh<_i159.GetCategoriesUseCase>(),
        gh<_i778.GetSubCategoriesUseCase>(),
      ),
    );
    gh.factory<_i995.LoginUseCase>(
      () => _i995.LoginUseCase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i257.RegisterUseCase>(
      () => _i257.RegisterUseCase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i26.CartRepository>(
      () => _i1063.CartRepositoryImpl(
        gh<_i747.CartRemoteDataSource>(),
        gh<_i817.CartMapper>(),
      ),
    );
    gh.factory<_i268.ProductsCubit>(
      () => _i268.ProductsCubit(gh<_i582.GetProductsUseCase>()),
    );
    gh.factory<_i333.LoginCubit>(
      () => _i333.LoginCubit(gh<_i995.LoginUseCase>()),
    );
    gh.factory<_i334.HomeCubit>(
      () => _i334.HomeCubit(
        gh<_i159.GetCategoriesUseCase>(),
        gh<_i582.GetProductsUseCase>(),
      ),
    );
    gh.factory<_i712.RegisterCubit>(
      () => _i712.RegisterCubit(gh<_i257.RegisterUseCase>()),
    );
    gh.factory<_i659.AddToCartUsecase>(
      () => _i659.AddToCartUsecase(gh<_i26.CartRepository>()),
    );
    gh.factory<_i179.GetCartUsecase>(
      () => _i179.GetCartUsecase(gh<_i26.CartRepository>()),
    );
    gh.factory<_i355.RemoveFromCartUsecase>(
      () => _i355.RemoveFromCartUsecase(gh<_i26.CartRepository>()),
    );
    gh.factory<_i380.UpdateCartQtyUsecase>(
      () => _i380.UpdateCartQtyUsecase(gh<_i26.CartRepository>()),
    );
    gh.singleton<_i779.CartCubit>(
      () => _i779.CartCubit(
        gh<_i179.GetCartUsecase>(),
        gh<_i659.AddToCartUsecase>(),
        gh<_i355.RemoveFromCartUsecase>(),
        gh<_i380.UpdateCartQtyUsecase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i567.NetworkModule {}
