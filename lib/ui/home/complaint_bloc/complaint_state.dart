part of 'complaint_bloc.dart';

@immutable
sealed class ComplaintState {}

final class ComplaintInitial extends ComplaintState {}

final class LoadingState extends ComplaintState{}

final class SuccessState extends ComplaintState {}

final class ErrorState extends ComplaintState {}
