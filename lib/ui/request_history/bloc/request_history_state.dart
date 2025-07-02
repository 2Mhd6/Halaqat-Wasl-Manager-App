part of 'request_history_bloc.dart';

@immutable
sealed class RequestHistoryState { 
  // The currently selected day filter index
  final int selectedIndex;

  RequestHistoryState({required this.selectedIndex});
}


final class RequestHistoryInitial extends RequestHistoryState {
  // Initial state 
  RequestHistoryInitial({super.selectedIndex = 0});
}

// Loading state (show a loading indicator)
final class RequestHistoryLoadingState extends RequestHistoryState {
  RequestHistoryLoadingState({required super.selectedIndex}); 
}

// Data loaded "successfully state"
final class RequestHistoryDataState extends RequestHistoryState {
  final List<RequestModel> requests;

  RequestHistoryDataState({
    this.requests = const [],
    super.selectedIndex = 0,
  });
}