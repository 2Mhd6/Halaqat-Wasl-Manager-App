import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/base_history_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/request_history/bloc/request_history_bloc.dart';

class RequestHistoryScreen extends StatelessWidget {
  const RequestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestHistoryBloc()..add(RequestHistoryLoadEvent()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<RequestHistoryBloc, RequestHistoryState>(
            builder: (context, state) {
              return BaseHistoryScreen(
                title: 'Request History',
                selectedIndex:   state.selectedIndex ,
                requests: 
                  state is RequestHistoryDataState ? state.requests : [],
                
                isLoading: state is RequestHistoryLoadingState,
                onDaySelected: (index) => 
                  context.read<RequestHistoryBloc>().add(RequestHistoryLoadEvent(selectedIndex: index)),
              );
            },
          );
        }
      ),
    );
  }
}
