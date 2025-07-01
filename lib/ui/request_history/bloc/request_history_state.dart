part of 'request_history_bloc.dart';

@immutable
sealed class RequestHistoryState {  final int selectedIndex;

  RequestHistoryState({required this.selectedIndex});
}

final class RequestHistoryInitial extends RequestHistoryState {
  RequestHistoryInitial({super.selectedIndex = 0});
}

final class RequestHistoryLoadingState extends RequestHistoryState {
  RequestHistoryLoadingState({required super.selectedIndex}); 
}

final class RequestHistoryDataState extends RequestHistoryState {
  final List<String> requests;

  RequestHistoryDataState({
    this.requests = const ['', '', '', '', '', '', '', '', '', '',  '', '', '', '', '', '', '', '', ''],
    super.selectedIndex = 0,
  });
}