part of 'complaint_history_bloc.dart';

@immutable
sealed class ComplaintHistoryState {
// The currently selected day filter index
  final int selectedIndex;

  const ComplaintHistoryState({required this.selectedIndex});
}

final class ComplaintHistoryInitial extends ComplaintHistoryState {
// Initial state 
  const ComplaintHistoryInitial({super.selectedIndex = 0});
}

// Loading state (show a loading indicator)
final class ComplaintHistoryLoadingState extends ComplaintHistoryState {
  const ComplaintHistoryLoadingState({required super.selectedIndex});
}

// Data loaded "successfully state"
final class ComplaintHistoryDataState extends ComplaintHistoryState {
  final List<ComplaintModel> complaints;

  const ComplaintHistoryDataState({
    this.complaints = const [],
    super.selectedIndex = 0,
  });
}
