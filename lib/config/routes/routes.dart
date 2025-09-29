import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/Auth/login.dart';
import 'package:responsivity/features/Auth/signup.dart';
import 'package:responsivity/pages/splashscreen.dart';
import 'package:responsivity/pages/welcomPage.dart';
import 'package:responsivity/test.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    // Add more routes here
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.signup,
      builder: (context, state) => const SignUp(),
    ),
  ],
);
