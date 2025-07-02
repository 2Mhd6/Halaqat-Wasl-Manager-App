part of 'complaint_history_bloc.dart';

@immutable
sealed class ComplaintHistoryState {
// The currently selected day filter index
  final int selectedIndex;

  ComplaintHistoryState({required this.selectedIndex});
}

final class ComplaintHistoryInitial extends ComplaintHistoryState {
// Initial state 
  ComplaintHistoryInitial({super.selectedIndex = 0});
}

// Loading state (show a loading indicator)
final class ComplaintHistoryLoadingState extends ComplaintHistoryState {
  ComplaintHistoryLoadingState({required super.selectedIndex});
}

// Data loaded "successfully state"
final class ComplaintHistoryDataState extends ComplaintHistoryState {
  final List<String> complaints;

  ComplaintHistoryDataState({
    this.complaints = const ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
    super.selectedIndex = 0,
  });
}
