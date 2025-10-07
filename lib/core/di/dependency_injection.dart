import 'package:dio/dio.dart';
import 'package:ecommerce_assignment3/core/networking/api_service.dart';
import 'package:ecommerce_assignment3/core/networking/dio_factory.dart';
import 'package:ecommerce_assignment3/features/home/data/apis/home_api_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos_impl/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/login/data/repos_impl/login_repo_impl.dart';
import '../../features/login/domain/repos/login_repo.dart';
import '../../features/login/preesentation/cubit/login_cubit.dart';
import '../../features/sign_up/data/repos_impl/sign_up_repo_impl.dart';
import '../../features/sign_up/domain/repos/sign_up_repo.dart';
import '../../features/sign_up/presentation/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepoImpl(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
}
