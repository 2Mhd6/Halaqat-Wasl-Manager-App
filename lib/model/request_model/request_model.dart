import 'package:dart_mappable/dart_mappable.dart';
import 'package:halaqat_wasl_manager_app/model/hospital_model/hospital_model.dart';

part 'request_model.mapper.dart';

@MappableClass()
class RequestModel with RequestModelMappable {
  RequestModel({
    required this.requestId,
    required this.userId,
    this.charityId = '',
    this.hospitalId = '',
    this.complaintId = '',
    this.driverId = '',
    this.pickupLat = 0.0,
    this.pickupLong = 0.0,
    this.destinationLat = 0.0,
    this.destinationLong = 0.0,
    this.status = '',
    this.date = '',
    this.hospital,
    this.note,
  });

  @MappableField(key: 'request_id')
  final String requestId;

  @MappableField(key: 'user_id')
  final String userId;

  @MappableField(key: 'charity_id')
  final String charityId;

  @MappableField(key: 'hospital_id')
  final String hospitalId;

  @MappableField(key: 'complaint_id')
  final String complaintId;

  @MappableField(key: 'driver_id')
  final String driverId;

  @MappableField(key: 'pick_up_lat')
  final double pickupLat;

  @MappableField(key: 'pick_up_long')
  final double pickupLong;

  @MappableField(key: 'destination_lat')
  final double destinationLat;

  @MappableField(key: 'destination_long')
  final double destinationLong;

  @MappableField(key: 'request_date')
  final String date;

  final HospitalModel? hospital;

  final String status;

  final String? note;
}
