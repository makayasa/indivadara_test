// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sample _$SampleFromJson(Map<String, dynamic> json) => Sample(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      totalUsers: json['total_users'] as int?,
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SampleToJson(Sample instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total_users': instance.totalUsers,
      'offset': instance.offset,
      'limit': instance.limit,
      'users': instance.users,
    };
