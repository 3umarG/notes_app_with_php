import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_php/core/constants/strings.dart';
import 'package:notes_app_with_php/presentation/screens/auth/signup/sign_up_screen.dart';
import 'package:notes_app_with_php/presentation/screens/home/home_screen.dart';
import 'package:notes_app_with_php/presentation/screens/splash/splash_screen.dart';

import '../../business/auth/auth_cubit.dart';
import '../../presentation/screens/auth/signin/sign_in_screen.dart';
import '../service_locator/sl.dart';

class AppRouter {
  late AuthCubit authCubit;

  AppRouter() {
    authCubit = AuthCubit(sl());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutes.signUpScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => authCubit,
            child: SignUpScreen(),
          ),
        );
      case AppRoutes.signInScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => authCubit,
            child: SignInScreen(),
          ),
        );
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
