import 'dart:async';
import 'dart:developer';
import 'package:halaqat_wasl_manager_app/model/charity_model/charity_model.dart';
import 'package:halaqat_wasl_manager_app/model/complaint_model/complaint_model.dart';
import 'package:halaqat_wasl_manager_app/model/driver_model/driver_model.dart';
import 'package:halaqat_wasl_manager_app/model/hospital_model/hospital_model.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/model/user_model/user_model.dart';
import 'package:halaqat_wasl_manager_app/shared/set_up.dart';


class RequestsRepo {

  static final _requestSupabase = SetupSupabase.sharedSupabase;


  static Future<List<RequestModel>> gettingAllPendingRequests() async {

    try{
      
      final requestQuery = await _requestSupabase.client.from('requests').select('*, users(*), charity(*), driver(*), hospital(*), complaint(*)').eq('status', 'pending');

      final allPendingRequests = requestQuery.map((request) {
        return RequestModel(
          requestId: request['request_id'],
          userId: request['user_id'],
          charityId: request['charity_id'],
          hospitalId: request['hospital_id'],
          complaintId: request['complaint_id'],
          driverId: request['driver_id'],
          pickupLat: request['pick_up_lat'],
          pickupLong: request['pick_up_long'],
          destinationLat: request['destination_lat'],
          destinationLong: request['destination_long'],
          requestDate: DateTime.parse(request['request_date']),
          status: request['status'],
          note: request['note'],
          user: request['users'] != null ? UserModelMapper.fromMap(request['users']) : null,
          charity: request['charity'] != null ? CharityModelMapper.fromMap(request['charity']) : null,
          driver: request['driver'] != null ? DriverModelMapper.fromMap(request['driver']) : null,
          hospital: request['hospital'] != null ? HospitalModelMapper.fromMap(request['hospital']) : null,
          complaint: request['complaint'] != null ? ComplaintModelMapper.fromMap(request['complaint']) : null,
          );}).toList();

          log('Success Getting All pending Requests');
          
          
          return allPendingRequests;

    }catch(error){

      log('General Exception - Something went wrong when we trying to get the pending requests');
      throw error.toString();

    }
  }


  // static Future<List<RequestModel>> gettingAllRequests() async {

  //   try {

  //     final charityId = _requestSupabase.client.auth.currentUser!.id;

  //     final newRequestsQuery = await _requestSupabase.client.from('requests').select('*, users(*), charity(*), driver(*), hospital(*), complaint(*)').eq('charity_id',charityId);

  //     final newRequests = newRequestsQuery.map((e) => RequestModelMapper.fromMap(e)).toList();

  //     return newRequests;

  //   } catch (error) {
  //     log('Getting All Complaints - Something went wrong while getting all complaints}',);
  //     throw error.toString();
  //   }
  // }


    static Future<void> assigningRequestToDriver({required RequestModel request, required String driverId}) async {
      try{

        await _requestSupabase.client.from('requests')
        .update({'driver_id': driverId, 'status' : 'accepted', 'charity_id' : _requestSupabase.client.auth.currentUser!.id })
        .eq('request_id', request.requestId);

        log('Success Assigning Driver To a request ${request.requestId}');

      }catch(error){

        log('General Exception -- Something went wrong while assign a request to a driver');
        throw error.toString();

      }
    }
}