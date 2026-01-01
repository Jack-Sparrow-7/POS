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
import 'package:serverpod/serverpod.dart' as _i1;
import 'time_slot.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class SessionInfo
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SessionInfo._({
    required this.timeSlots,
    required this.isSessionEnabled,
  });

  factory SessionInfo({
    required List<_i2.TimeSlot> timeSlots,
    required bool isSessionEnabled,
  }) = _SessionInfoImpl;

  factory SessionInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return SessionInfo(
      timeSlots: _i3.Protocol().deserialize<List<_i2.TimeSlot>>(
        jsonSerialization['timeSlots'],
      ),
      isSessionEnabled: jsonSerialization['isSessionEnabled'] as bool,
    );
  }

  List<_i2.TimeSlot> timeSlots;

  bool isSessionEnabled;

  /// Returns a shallow copy of this [SessionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionInfo copyWith({
    List<_i2.TimeSlot>? timeSlots,
    bool? isSessionEnabled,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SessionInfo',
      'timeSlots': timeSlots.toJson(valueToJson: (v) => v.toJson()),
      'isSessionEnabled': isSessionEnabled,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SessionInfo',
      'timeSlots': timeSlots.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'isSessionEnabled': isSessionEnabled,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SessionInfoImpl extends SessionInfo {
  _SessionInfoImpl({
    required List<_i2.TimeSlot> timeSlots,
    required bool isSessionEnabled,
  }) : super._(
         timeSlots: timeSlots,
         isSessionEnabled: isSessionEnabled,
       );

  /// Returns a shallow copy of this [SessionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionInfo copyWith({
    List<_i2.TimeSlot>? timeSlots,
    bool? isSessionEnabled,
  }) {
    return SessionInfo(
      timeSlots:
          timeSlots ?? this.timeSlots.map((e0) => e0.copyWith()).toList(),
      isSessionEnabled: isSessionEnabled ?? this.isSessionEnabled,
    );
  }
}
