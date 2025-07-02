part of 'complaint_history_bloc.dart';

@immutable
sealed class ComplaintHistoryEvent {}
// Event to load complaint history data
class ComplaintHistoryLoadEvent extends ComplaintHistoryEvent {
// Index of selected day filter
  final int selectedIndex;
//default value
  ComplaintHistoryLoadEvent({this.selectedIndex = 0});
}
