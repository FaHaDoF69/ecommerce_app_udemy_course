import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/address/address_screen.dart';
import 'package:ecommerce_app/features/auth/login_screen.dart';
import 'package:ecommerce_app/features/auth/register_screen.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/product_screen/product_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.loginScreen, routes: [
    GoRoute(
      name: AppRoutes.loginScreen,
      path: AppRoutes.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: AppRoutes.registerScreen,
      path: AppRoutes.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: AppRoutes.mainScreen,
      path: AppRoutes.mainScreen,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      name: AppRoutes.productScreen,
      path: AppRoutes.productScreen,
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      name: AppRoutes.addressScreen,
      path: AppRoutes.addressScreen,
      builder: (context, state) => const AddressScreen(),
    ),
  ]);
}
