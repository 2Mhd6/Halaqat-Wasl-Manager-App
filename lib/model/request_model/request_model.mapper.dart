// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_model.dart';

class RequestModelMapper extends ClassMapperBase<RequestModel> {
  RequestModelMapper._();

  static RequestModelMapper? _instance;
  static RequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RequestModel';

  static String _$requestId(RequestModel v) => v.requestId;
  static const Field<RequestModel, String> _f$requestId =
      Field('requestId', _$requestId, key: r'request_id');
  static String _$userId(RequestModel v) => v.userId;
  static const Field<RequestModel, String> _f$userId =
      Field('userId', _$userId, key: r'user_id');
  static String? _$charityId(RequestModel v) => v.charityId;
  static const Field<RequestModel, String> _f$charityId =
      Field('charityId', _$charityId, key: r'charity_id');
  static String _$hospitalId(RequestModel v) => v.hospitalId;
  static const Field<RequestModel, String> _f$hospitalId =
      Field('hospitalId', _$hospitalId, key: r'hospital_id');
  static String? _$complaintId(RequestModel v) => v.complaintId;
  static const Field<RequestModel, String> _f$complaintId =
      Field('complaintId', _$complaintId, key: r'complaint_id');
  static String? _$driverId(RequestModel v) => v.driverId;
  static const Field<RequestModel, String> _f$driverId =
      Field('driverId', _$driverId, key: r'driver_id');
  static double _$pickupLat(RequestModel v) => v.pickupLat;
  static const Field<RequestModel, double> _f$pickupLat =
      Field('pickupLat', _$pickupLat, key: r'pick_up_lat');
  static double _$pickupLong(RequestModel v) => v.pickupLong;
  static const Field<RequestModel, double> _f$pickupLong =
      Field('pickupLong', _$pickupLong, key: r'pick_up_long');
  static double _$destinationLat(RequestModel v) => v.destinationLat;
  static const Field<RequestModel, double> _f$destinationLat =
      Field('destinationLat', _$destinationLat, key: r'destination_lat');
  static double _$destinationLong(RequestModel v) => v.destinationLong;
  static const Field<RequestModel, double> _f$destinationLong =
      Field('destinationLong', _$destinationLong, key: r'destination_long');
  static String _$state(RequestModel v) => v.state;
  static const Field<RequestModel, String> _f$state = Field('state', _$state);
  static String? _$note(RequestModel v) => v.note;
  static const Field<RequestModel, String> _f$note =
      Field('note', _$note, opt: true);

  @override
  final MappableFields<RequestModel> fields = const {
    #requestId: _f$requestId,
    #userId: _f$userId,
    #charityId: _f$charityId,
    #hospitalId: _f$hospitalId,
    #complaintId: _f$complaintId,
    #driverId: _f$driverId,
    #pickupLat: _f$pickupLat,
    #pickupLong: _f$pickupLong,
    #destinationLat: _f$destinationLat,
    #destinationLong: _f$destinationLong,
    #state: _f$state,
    #note: _f$note,
  };

  static RequestModel _instantiate(DecodingData data) {
    return RequestModel(
        requestId: data.dec(_f$requestId),
        userId: data.dec(_f$userId),
        charityId: data.dec(_f$charityId),
        hospitalId: data.dec(_f$hospitalId),
        complaintId: data.dec(_f$complaintId),
        driverId: data.dec(_f$driverId),
        pickupLat: data.dec(_f$pickupLat),
        pickupLong: data.dec(_f$pickupLong),
        destinationLat: data.dec(_f$destinationLat),
        destinationLong: data.dec(_f$destinationLong),
        state: data.dec(_f$state),
        note: data.dec(_f$note));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestModel>(map);
  }

  static RequestModel fromJson(String json) {
    return ensureInitialized().decodeJson<RequestModel>(json);
  }
}

mixin RequestModelMappable {
  String toJson() {
    return RequestModelMapper.ensureInitialized()
        .encodeJson<RequestModel>(this as RequestModel);
  }

  Map<String, dynamic> toMap() {
    return RequestModelMapper.ensureInitialized()
        .encodeMap<RequestModel>(this as RequestModel);
  }

  RequestModelCopyWith<RequestModel, RequestModel, RequestModel> get copyWith =>
      _RequestModelCopyWithImpl<RequestModel, RequestModel>(
          this as RequestModel, $identity, $identity);
  @override
  String toString() {
    return RequestModelMapper.ensureInitialized()
        .stringifyValue(this as RequestModel);
  }

  @override
  bool operator ==(Object other) {
    return RequestModelMapper.ensureInitialized()
        .equalsValue(this as RequestModel, other);
  }

  @override
  int get hashCode {
    return RequestModelMapper.ensureInitialized()
        .hashValue(this as RequestModel);
  }
}

extension RequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RequestModel, $Out> {
  RequestModelCopyWith<$R, RequestModel, $Out> get $asRequestModel =>
      $base.as((v, t, t2) => _RequestModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RequestModelCopyWith<$R, $In extends RequestModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? requestId,
      String? userId,
      String? charityId,
      String? hospitalId,
      String? complaintId,
      String? driverId,
      double? pickupLat,
      double? pickupLong,
      double? destinationLat,
      double? destinationLong,
      String? state,
      String? note});
  RequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RequestModel, $Out>
    implements RequestModelCopyWith<$R, RequestModel, $Out> {
  _RequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RequestModel> $mapper =
      RequestModelMapper.ensureInitialized();
  @override
  $R call(
          {String? requestId,
          String? userId,
          Object? charityId = $none,
          String? hospitalId,
          Object? complaintId = $none,
          Object? driverId = $none,
          double? pickupLat,
          double? pickupLong,
          double? destinationLat,
          double? destinationLong,
          String? state,
          Object? note = $none}) =>
      $apply(FieldCopyWithData({
        if (requestId != null) #requestId: requestId,
        if (userId != null) #userId: userId,
        if (charityId != $none) #charityId: charityId,
        if (hospitalId != null) #hospitalId: hospitalId,
        if (complaintId != $none) #complaintId: complaintId,
        if (driverId != $none) #driverId: driverId,
        if (pickupLat != null) #pickupLat: pickupLat,
        if (pickupLong != null) #pickupLong: pickupLong,
        if (destinationLat != null) #destinationLat: destinationLat,
        if (destinationLong != null) #destinationLong: destinationLong,
        if (state != null) #state: state,
        if (note != $none) #note: note
      }));
  @override
  RequestModel $make(CopyWithData data) => RequestModel(
      requestId: data.get(#requestId, or: $value.requestId),
      userId: data.get(#userId, or: $value.userId),
      charityId: data.get(#charityId, or: $value.charityId),
      hospitalId: data.get(#hospitalId, or: $value.hospitalId),
      complaintId: data.get(#complaintId, or: $value.complaintId),
      driverId: data.get(#driverId, or: $value.driverId),
      pickupLat: data.get(#pickupLat, or: $value.pickupLat),
      pickupLong: data.get(#pickupLong, or: $value.pickupLong),
      destinationLat: data.get(#destinationLat, or: $value.destinationLat),
      destinationLong: data.get(#destinationLong, or: $value.destinationLong),
      state: data.get(#state, or: $value.state),
      note: data.get(#note, or: $value.note));

  @override
  RequestModelCopyWith<$R2, RequestModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
