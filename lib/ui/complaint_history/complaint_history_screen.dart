import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/base_history_screen.dart';

class ComplaintHistoryScreen extends StatelessWidget {
  const ComplaintHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHistoryScreen(title: 'Complaint History', isLoading: false,);
  }
}
