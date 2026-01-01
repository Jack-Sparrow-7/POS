/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'enums/day.dart' as _i2;

abstract class TimeSlot implements _i1.SerializableModel {
  TimeSlot._({
    required this.day,
    required this.enabled,
    required this.startTime,
    required this.endTime,
  });

  factory TimeSlot({
    required _i2.Day day,
    required bool enabled,
    required String startTime,
    required String endTime,
  }) = _TimeSlotImpl;

  factory TimeSlot.fromJson(Map<String, dynamic> jsonSerialization) {
    return TimeSlot(
      day: _i2.Day.fromJson((jsonSerialization['day'] as String)),
      enabled: jsonSerialization['enabled'] as bool,
      startTime: jsonSerialization['startTime'] as String,
      endTime: jsonSerialization['endTime'] as String,
    );
  }

  _i2.Day day;

  bool enabled;

  String startTime;

  String endTime;

  /// Returns a shallow copy of this [TimeSlot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TimeSlot copyWith({
    _i2.Day? day,
    bool? enabled,
    String? startTime,
    String? endTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TimeSlot',
      'day': day.toJson(),
      'enabled': enabled,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TimeSlotImpl extends TimeSlot {
  _TimeSlotImpl({
    required _i2.Day day,
    required bool enabled,
    required String startTime,
    required String endTime,
  }) : super._(
         day: day,
         enabled: enabled,
         startTime: startTime,
         endTime: endTime,
       );

  /// Returns a shallow copy of this [TimeSlot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TimeSlot copyWith({
    _i2.Day? day,
    bool? enabled,
    String? startTime,
    String? endTime,
  }) {
    return TimeSlot(
      day: day ?? this.day,
      enabled: enabled ?? this.enabled,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
