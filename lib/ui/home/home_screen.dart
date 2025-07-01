import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/ui/complaint_history/complaint_history_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/request_history/request_history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(child: RequestHistoryScreen()),
                );
              },
              child: Text('Show Request History'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(child: ComplaintHistoryScreen()),
                );
              },
              child: Text('Show Complaint  History'),
            ),
          ),
        ],
      ),
    );
  }
}
