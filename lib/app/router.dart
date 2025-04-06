import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_fatani/features/aboutUs/view/aboutUs.dart';
import 'package:ma_fatani/features/indicative_Opinions/views/indicative_Opinions.dart';
import 'package:ma_fatani/features/language/views/language_screen.dart';
import 'package:ma_fatani/features/prayer_times/views/prayer_times.dart';
import '../presentation/features/onboarding/views/onboarding_view.dart';
import '../presentation/features/home/views/home_view.dart';
import '../presentation/features/add_plan/views/add_plan_view.dart';

class AppRouter {
  AppRouter._();
  static const String onBoarding = '/onboarding';
  static const String home = '/home';
  static const String addPlan = '/add-plan';
  static const String indicativeOpinions = '/IndicativeOpinions';
  static const String prayerTimes = '/PrayerTimes';
  static const String language = '/Language';
  static const String aboutUs = '/aboutUs';
}

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
          return NavigationTransition(child, animation, bottomToTop: true);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRouter.indicativeOpinions,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const IndicativeOpinionsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return NavigationTransition(child, animation, rightToLeft: true);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRouter.prayerTimes,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PrayerTimesScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return NavigationTransition(child, animation, rightToLeft: true);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRouter.language,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LanguageScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return NavigationTransition(child, animation, rightToLeft: true);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRouter.aboutUs,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AboutUsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return NavigationTransition(child, animation, rightToLeft: true);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
  ],
);

Widget NavigationTransition(Widget widget, Animation<double> animation,
    {bool bottomToTop = false, bool rightToLeft = false}) {
  var begin =
      Offset(rightToLeft == true ? -1.0 : 0.0, bottomToTop == true ? 1.0 : 0.0);
  const end = Offset.zero;
  const curve = Curves.ease;
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return SlideTransition(position: animation.drive(tween), child: widget);
}
