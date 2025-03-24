import 'package:flutter/material.dart';
import '../viewmodels/add_plan_viewmodel.dart';

class AddPlanView extends StatelessWidget {
  const AddPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة خطة'),
      ),
      body: const Center(
        child: Text(
          'صفحة إضافة خطة جديدة',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
