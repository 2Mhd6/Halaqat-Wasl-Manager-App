import 'package:halaqat_wasl_manager_app/model/charity_model/charity_model.dart';
import 'package:halaqat_wasl_manager_app/model/complaint_model/complaint_model.dart';
import 'package:halaqat_wasl_manager_app/model/driver_model/driver_model.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';

class CharityData {

  // Charity
  late CharityModel charity;

  // Requests
  // List<RequestModel> allRequests = [];
  List<RequestModel> pendingRequests = [];

  // Drivers 
  // - drivers used for driver bloc 
  // - availableDrivers used for requestBloc
  List<DriverModel> drivers = [];
  List<DriverModel> availableDrivers = [];

  // Complaints
  List<ComplaintModel> complaints = [];
  List<ComplaintModel> activeComplaints = [];
}