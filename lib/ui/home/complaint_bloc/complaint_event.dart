part of 'complaint_bloc.dart';

@immutable
sealed class ComplaintEvent {}

final class ChangeDateRangeEvent extends ComplaintEvent {
  final int selectedIndex;
  ChangeDateRangeEvent({required this.selectedIndex});
}

final class GettingDataBasedOnDate extends ComplaintEvent{}