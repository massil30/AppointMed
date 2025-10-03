import 'package:chat_package/chat_package.dart';
import 'package:go_router/go_router.dart';
import 'package:responsivity/config/routes/routesName.dart';
import 'package:responsivity/features/Auth/login.dart';
import 'package:responsivity/features/Auth/signup.dart';
import 'package:responsivity/features/chat/chatPage.dart';
import 'package:responsivity/features/chat/chat_people.dart';
import 'package:responsivity/features/doctors/doctorDetails.dart';
import 'package:responsivity/features/doctors/doctors.dart';
import 'package:responsivity/features/favorite/favoritepage.dart';
import 'package:responsivity/features/noteficaiton/notefication.dart'
    show NotificationPage;
import 'package:responsivity/features/payment/paymentCard.dart';
import 'package:responsivity/features/payment/paymentMethode.dart';
import 'package:responsivity/features/payment/sucessPayment.dart';
import 'package:responsivity/features/profile/editprofile.dart';
import 'package:responsivity/features/profile/profile.dart';
import 'package:responsivity/pages/helpCenter/help_center.dart';
import 'package:responsivity/pages/homepage/homepage.dart';
import 'package:responsivity/pages/privacy_policy.dart';
import 'package:responsivity/pages/welcomPage.dart';
import 'package:responsivity/test.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.successPayment,
  routes: [
    GoRoute(path: RouteNames.splash, builder: (context, state) => Test()),
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
      path: RouteNames.privacyPolicy,
      builder: (context, state) => const PrivacyPolicyPage(),
    ),
    GoRoute(
      path: RouteNames.helpCenter,
      builder: (context, state) => const HelpCenterPage(),
    ),
    GoRoute(
      path: RouteNames.notification,
      builder: (context, state) => const NotificationPage(),
    ),
    //Chat
    GoRoute(
      path: RouteNames.chat_people,
      builder: (context, state) => ChatPeoplePage(),
    ),
    GoRoute(path: RouteNames.chat, builder: (context, state) => ChatPage()),

    // Doctors
    GoRoute(
      path: RouteNames.doctors,
      builder: (context, state) => DoctorsPage(),
    ),
    GoRoute(
      path: RouteNames.doctors_details,
      builder: (context, state) => DoctorDetails(),
    ),
    //Payments
    GoRoute(
      path: RouteNames.paymentMethod,
      builder: (context, state) => const Paymentmethode(),
    ),
    GoRoute(
      path: RouteNames.addCard,
      builder: (context, state) => const AddCard(),
    ),
    GoRoute(
      path: RouteNames.successPayment,
      builder: (context, state) => const PaymentSuccess(),
    ),
    GoRoute(
      path: RouteNames.favorite,
      builder: (context, state) => const FavorisPage(),
    ),
  ],
);
