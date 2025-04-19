import 'package:firebase_analytics/firebase_analytics.dart';
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
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xffECF0F1),
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
            onHomeTap: () async{
              _pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
        await analytics.logEvent(
            name: 'nav_bar_item_tapped',
            parameters: {"item": "Home"});
            },
            onSettingsTap: ()async {
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
                     await analytics.logEvent(
            name: 'nav_bar_item_tapped',
            parameters: {"item": "Settings"});
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
