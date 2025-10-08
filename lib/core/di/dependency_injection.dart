import 'package:dio/dio.dart';
import 'package:ecommerce_assignment3/core/networking/api_service.dart';
import 'package:ecommerce_assignment3/core/networking/dio_factory.dart';
import 'package:ecommerce_assignment3/features/home/data/apis/home_api_service.dart';
import 'package:ecommerce_assignment3/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/login/data/repos_impl/login_repo_impl.dart';
import '../../features/login/domain/repos/login_repo.dart';
import '../../features/login/preesentation/cubit/login_cubit.dart';
import '../../features/product_details/data/apis/product_details_api_service.dart';
import '../../features/product_details/data/repos/product_details_repo_impl.dart';
import '../../features/product_details/domain/repos/product_details_repo.dart';
import '../../features/product_details/presentation/cubit/product_details_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // product details
  getIt.registerLazySingleton<ProductDetailsApiService>(() => ProductDetailsApiService(dio));
  getIt.registerLazySingleton<ProductDetailsRepo>(() => ProductDetailsRepoImpl(getIt()));
  getIt.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(getIt()));
}
