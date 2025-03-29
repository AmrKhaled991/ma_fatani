import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../presentation/features/onboarding/views/onboarding_view.dart';
import '../presentation/features/home/views/home_view.dart';
import '../presentation/features/add_plan/views/add_plan_view.dart';

class AppRouter {
  AppRouter._();
  static const String onBoarding = '/onboarding';
  static const String home = '/home';
  static const String addPlan = '/add-plan';
}

//test  1 
//test 2
final router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: AppRouter.onBoarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: AppRouter.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRouter.addPlan,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AddPlanView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
  ],
);
