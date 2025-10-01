import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/Auth/login.dart';
import 'package:responsivity/features/Auth/signup.dart';
import 'package:responsivity/features/chat/chatPage.dart';
import 'package:responsivity/features/favorite/favoritepage.dart';
import 'package:responsivity/features/profile/editprofile.dart';
import 'package:responsivity/features/profile/profile.dart';
import 'package:responsivity/pages/bottom_navigation_bar.dart';
import 'package:responsivity/pages/homepage/homepage.dart';
import 'package:responsivity/pages/welcomPage.dart';
import 'package:responsivity/test.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => PorfilePage(),
    ),
    GoRoute(
      path: RouteNames.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.signup,
      builder: (context, state) => const SignUp(),
    ),
    // Main Pages
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomePage(),
    ),
    //Profiles
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) => const PorfilePage(),
    ),
    GoRoute(
      path: RouteNames.editProfile,
      builder: (context, state) => const EditProfilePage(),
    ),
    GoRoute(
      path: RouteNames.chat,
      builder: (context, state) => const Chatpage(),
    ),
    GoRoute(
      path: RouteNames.favorite,
      builder: (context, state) => const FavorisPage(),
    ),
  ],
);
