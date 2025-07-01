part of 'request_history_bloc.dart';

@immutable
sealed class RequestHistoryEvent {}

class RequestHistoryLoadEvent extends RequestHistoryEvent {
  final int selectedIndex;

  RequestHistoryLoadEvent({this.selectedIndex = 0});
}