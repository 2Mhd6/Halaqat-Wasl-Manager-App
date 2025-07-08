part of 'statistic_bloc.dart';

@immutable
sealed class StatisticEvent {}

final class GetStatisticEvent extends StatisticEvent{}

final class UpdatingStatisticEvent extends StatisticEvent{}