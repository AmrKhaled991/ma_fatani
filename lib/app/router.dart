import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/onboarding/views/onboarding_view.dart';
import '../features/home/views/home_view.dart';
import '../features/settings/views/settings_view.dart';
import '../features/add_plan/views/add_plan_view.dart';

final router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/add-plan',
      builder: (context, state) => const AddPlanView(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsView(),
    ),
  ],
);
