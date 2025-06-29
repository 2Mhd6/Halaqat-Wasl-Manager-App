import 'package:dart_mappable/dart_mappable.dart';

part 'hospital_model.mapper.dart';

@MappableClass()
class HospitalModel with HospitalModelMappable {
  HospitalModel({
    required this.hospitalId,
    required this.name,
    required this.charityLat,
    required this.charityLong,
  });

  @MappableField(key: 'hospital_id')
  final int hospitalId;

  final String name;

  @MappableField(key: 'charity_lat')
  final double charityLat;

  @MappableField(key: 'charity_long')
  final double charityLong;
}
