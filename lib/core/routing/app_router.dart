import 'package:ecommerce_assignment3/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_assignment3/features/cart/presentation/ui/cart_screen.dart';
import 'package:ecommerce_assignment3/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_assignment3/features/home/presentation/ui/home_screen.dart';
import 'package:ecommerce_assignment3/features/login/preesentation/cubit/login_cubit.dart';
import 'package:ecommerce_assignment3/features/login/preesentation/ui/login_screen.dart';
import 'package:ecommerce_assignment3/features/order_confirmed/ui/order_confirmed_screen.dart';
import 'package:ecommerce_assignment3/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:ecommerce_assignment3/features/product_details/presentation/ui/product_details_screen.dart';
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
      case Routes.productDetailsScreen:
        final productId = arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductDetailsCubit>()..getProductDetails(productId),
            child: ProductDetailsScreen(productId: productId),
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CartCubit>(),
            child: const CartScreen(),
          ),
        );
      case Routes.orderConfirmedScreen:
        return MaterialPageRoute(
          builder: (_) => const OrderConfirmedScreen(),
        );
      default:
        return null;
    }
  }
}
