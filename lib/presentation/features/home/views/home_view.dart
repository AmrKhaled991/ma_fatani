import 'package:flutter/material.dart';
import 'package:ma_fatani/presentation/features/home/views/widgets/custom_navigation_bar.dart';
import '../../settings/views/settings_view.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_fatani/app/router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: const [
              HomeTab(),
              SettingsView(),
            ],
          ),
          CustomNavigationBar(
            onHomeTap: () {
              _pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            onSettingsTap: () {
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            onAddTap: () {
              context.push(AppRouter.addPlan);
            },
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'محتوى الصفحة الرئيسية',
      style: TextStyle(fontSize: 18),
    );
  }
}
