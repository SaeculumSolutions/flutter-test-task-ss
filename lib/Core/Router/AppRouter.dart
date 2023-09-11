import 'package:go_router/go_router.dart';
import 'package:viswals_test/Core/Router/RouteName.dart';
import 'package:viswals_test/Features/Questions/Presentation/Screens/EnterNumberScreen.dart';
import 'package:viswals_test/Features/Questions/Presentation/Screens/QuestionsScreen.dart';
import 'package:viswals_test/Features/Questions/Presentation/Screens/WelcomScreen.dart';

/// use GoRouter for Route Manage
/// used for add Route of App screen
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: AppRouterName.welcomeScreen,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRouterName.questionScreen,
      builder: (context, state) => const QuestionsScreen(),
    ),
    GoRoute(
      path: AppRouterName.enterNumberScreen,
      builder: (context, state) => const EnterNumberScreen(),
    ),
  ],
);
