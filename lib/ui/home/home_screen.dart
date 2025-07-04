import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/ui/dialogs/add_new_driver.dart';
import 'package:halaqat_wasl_manager_app/ui/dialogs/complaint_details_dialog.dart.dart';
import 'package:halaqat_wasl_manager_app/ui/dialogs/request_details_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'), centerTitle: true),
      //       body: Center(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             showDialog(
      //               context: context,
      //               builder: (_) => const ComplaintDetailsDialog(
      //                 status: ComplaintStatus.viewOnly, //  viewOnly,responding
      //               ),
      //             );
      //           },
      //           child: const Text('Open Complaint Dialog'),
      //         ),
      //       ),
      //     );
      //   }
      // }
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       showDialog(
      //         context: context,
      //         builder: (_) => const RequestDetailsDialog(),
      //       );
      //     },
      //     child: const Text("Show Request Dialog"),
      //   ),
      // ),
body: Center(
     child:  ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (_) => const AddDriverDialog(),
    );
  },
  child: const Text("Add New Driver"),
),
),
    );
 
}
}