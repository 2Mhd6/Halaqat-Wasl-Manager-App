import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/repo/requests/requests_repository.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/base_history_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/request_history/bloc/request_history_bloc.dart';

class RequestHistoryScreen extends StatelessWidget {
  const RequestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestHistoryBloc(
        requestsRepository: context.read<RequestsRepository>(),
      )..add(RequestHistoryLoadEvent()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<RequestHistoryBloc, RequestHistoryState>(
            builder: (context, state) {
              return BaseHistoryScreen(
                title: 'Request History',

              // The currently selected day 
                selectedIndex: state.selectedIndex,
              // If the state contains the requests data, pass the list
              // Otherwise, pass an empty list
                requests: state is RequestHistoryDataState
                    ? state.requests
                    : [],

              // Show loading indicator if state is loading
                isLoading: state is RequestHistoryLoadingState,
              // On day selection, trigger load event with selected index
                onDaySelected: (index) => context
                    .read<RequestHistoryBloc>()
                    .add(RequestHistoryLoadEvent(selectedIndex: index)),
                itemBuilder: (BuildContext context, int index) {
                  final request =
                      (state as RequestHistoryDataState).requests[index];
                  return HistoryItem(
                    title: request.requestId.toString(),
                    state: request.status == 'pending',
                    date: request.date!,
                    hospital: request.hospital!.name,
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


