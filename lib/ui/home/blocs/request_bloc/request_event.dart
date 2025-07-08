part of 'request_bloc.dart';

@immutable
sealed class RequestEvent {}


final class FetchingDataFromDBEvent extends RequestEvent{}

final class SelectingDriverForRequest extends RequestEvent{}

final class AssigningRequestToDriverEvent extends RequestEvent{
  final RequestModel request;
  final DriverModel driver;

  AssigningRequestToDriverEvent({required this.request, required this.driver});
}

