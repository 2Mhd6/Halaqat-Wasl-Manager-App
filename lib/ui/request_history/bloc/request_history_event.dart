part of 'request_history_bloc.dart';

@immutable
sealed class RequestHistoryEvent {}
// Event to load request history data
class RequestHistoryLoadEvent extends RequestHistoryEvent {

// Index of selected day filter
  final int selectedIndex;
//default value
  RequestHistoryLoadEvent({this.selectedIndex = 0});
}