import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halaqat_wasl_manager_app/data/charity_data.dart';
import 'package:halaqat_wasl_manager_app/repo/charity/charity_operation_repo.dart';
import 'package:meta/meta.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  
  int totalServices = 0;
  int totalActiveComplaints = 0;
  int totalComplaints = 0;

  StatisticBloc() : super(StatisticInitial()) {

    on<StatisticEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetStatisticEvent>(getStatistic);
    on<UpdatingStatisticEvent>(updatingStatistic);
  }

  FutureOr<void> getStatistic(GetStatisticEvent event, Emitter<StatisticState> emit) {
    final getIt = GetIt.I.get<CharityData>();
    totalServices = getIt.charity.totalServices ?? 0;
    totalActiveComplaints = getIt.activeComplaints.length;
    totalComplaints = getIt.complaints.length;

    emit(SuccessState(successMessage: 'All Statistic are updated'));
  }

  FutureOr<void> updatingStatistic(UpdatingStatisticEvent event, Emitter<StatisticState> emit) async {

  try{
    
    // -- Getting data from Charity DB
    final charity = await CharityOperationRepo.gettingCharityDataFromDB();

    // -- Make a reference from Dependence injection
    GetIt.I.get<CharityData>().charity = charity;
    

    emit(SuccessState(successMessage: 'You got the updated version of your data'));

  }catch(error){
    emit(ErrorState(errorMessage: error.toString()));
  }
  }
}
