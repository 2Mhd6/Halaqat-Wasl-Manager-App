import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:halaqat_wasl_manager_app/data/charity_data.dart';
import 'package:halaqat_wasl_manager_app/model/charity_model/charity_model.dart';
import 'package:halaqat_wasl_manager_app/model/driver_model/driver_model.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/repo/charity/requests_repo.dart';
import 'package:meta/meta.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {

  

  RequestBloc() : super(RequestInitial()) {

    on<RequestEvent>((event, emit) {});

    on<FetchingDataFromDBEvent>(fetchingDataFromDB);

    on<SelectingDriverForRequest>((event, emit) => emit(SuccessSelectingDriverForRequestState()));

    on<AssigningRequestToDriverEvent>(assigningRequestToDriver);


  }

  FutureOr<void> fetchingDataFromDB(FetchingDataFromDBEvent event,Emitter<RequestState> emit) async {

    
    final charityGetIT = GetIt.I.get<CharityData>();
    log('---\n${charityGetIT.pendingRequests}');
    charityGetIT.pendingRequests = [];

    emit(LoadingRequestState());



    try {
      final List<RequestModel> allPendingRequest = await RequestsRepo.gettingAllPendingRequests();

      final List<RequestModel> requestFilteredByTenKM = filterRequestsUpToTenKM(requests: allPendingRequest, charity: charityGetIT.charity );

      charityGetIT.pendingRequests = requestFilteredByTenKM;

      emit(SuccessFetchingRequestDataFromDBState());
    } catch (error) {
      emit(ErrorFetchingRequestDataFromDBState(message: error.toString()));
    }
  }


  FutureOr<void> assigningRequestToDriver(AssigningRequestToDriverEvent event, Emitter<RequestState> emit) async {

    final request = event.request;
    final driver = event.driver;

    try{
      await RequestsRepo.assigningRequestToDriver(request: request, driverId: driver.driverId);
      emit(SuccessAssigningDriverToRequestState());
    }catch(error){
      emit(ErrorAssigningDriverToRequestState(message: error.toString()));
    }
  }


  List<RequestModel> filterRequestsUpToTenKM({ required List<RequestModel> requests, required CharityModel charity})  {

    final charityLat = charity.charityLat;
    final charityLong = charity.charityLong;

    return requests.where((request) {
      double distanceInMeters = Geolocator.distanceBetween(
        charityLat!,
        charityLong!,
        request.pickupLat,
        request.pickupLong,
      );

      double distanceInKm = distanceInMeters / 1000;
      return distanceInKm <= 10;
    }).toList();
  }
}
