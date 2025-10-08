import 'package:ecommerce_assignment3/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_assignment3/features/home/presentation/ui/home_screen.dart';
import 'package:ecommerce_assignment3/features/login/preesentation/cubit/login_cubit.dart';
import 'package:ecommerce_assignment3/features/login/preesentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_assignment3/core/routing/routes.dart';
import 'package:ecommerce_assignment3/features/onboarding/onboarding_screen.dart';

import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
     
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getCategoriesAndProducts(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
