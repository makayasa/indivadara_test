import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'sample.g.dart';

@JsonSerializable()
class Sample {
  final bool? success;
  final String? message;
  @JsonKey(name: 'total_users')
  final int? totalUsers;
  final int? offset;
  final int? limit;
  final List<User>? users;

  const Sample({
    this.success,
    this.message,
    this.totalUsers,
    this.offset,
    this.limit,
    this.users,
  });

  @override
  String toString() {
    return 'Sample(success: $success, message: $message, totalUsers: $totalUsers, offset: $offset, limit: $limit, users: $users)';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    return _$SampleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SampleToJson(this);

  Sample copyWith({
    bool? success,
    String? message,
    int? totalUsers,
    int? offset,
    int? limit,
    List<User>? users,
  }) {
    return Sample(
      success: success ?? this.success,
      message: message ?? this.message,
      totalUsers: totalUsers ?? this.totalUsers,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      users: users ?? this.users,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Sample) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^
      message.hashCode ^
      totalUsers.hashCode ^
      offset.hashCode ^
      limit.hashCode ^
      users.hashCode;
}
