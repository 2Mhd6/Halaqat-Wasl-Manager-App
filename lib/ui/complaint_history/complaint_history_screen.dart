import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/repo/complaints/complaints_repository.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/base_history_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/complaint_history/bloc/complaint_history_bloc.dart';

class ComplaintHistoryScreen extends StatelessWidget {
  const ComplaintHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintHistoryBloc(
        complaintsRepository: context.read<ComplaintsRepository>(),
      )..add(ComplaintHistoryLoadEvent()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<ComplaintHistoryBloc, ComplaintHistoryState>(
            builder: (context, state) {
              return BaseHistoryScreen(
                title: 'Complaint History',

                // The currently selected day
                selectedIndex: state.selectedIndex,
                // If the state contains the requests data, pass the list
                // Otherwise, pass an empty list
                requests: state is ComplaintHistoryDataState
                    ? state.complaints
                    : [],
                // Show loading indicator if state is loading
                isLoading: state is ComplaintHistoryLoadingState,
                // On day selection, trigger load event with selected index
                onDaySelected: (index) => context
                    .read<ComplaintHistoryBloc>()
                    .add(ComplaintHistoryLoadEvent(selectedIndex: index)),
                itemBuilder: (BuildContext context, int index) {
                  final complaint =
                      (state as ComplaintHistoryDataState).complaints[index];
                  return HistoryItem(
                    title: complaint.complaintId,
                    state: complaint.isActive,
                    date: complaint.complaint,
                    hospital: complaint.hospitalId,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
