import 'package:flutter/material.dart';
import 'package:ma_fatani/presentation/features/home/views/widgets/custom_navigation_bar.dart';
import '../../add_plan/views/add_plan_view.dart';
import '../../settings/views/settings_view.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = HomeViewModel();
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: const [
              HomeTab(),
              AddPlanView(),
              SettingsView(),
            ],
          ),
          const CustomNavigationBar(),
        ],
      ),
    );
  }
}


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
      ),
      body: const Center(
        child: Text(
          'محتوى الصفحة الرئيسية',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
