// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      versionGroupDetails: (json['version_group_details'] as List<dynamic>?)
          ?.map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      detailMove: json['detail_move'] == null
          ? null
          : DetailMove.fromJson(json['detail_move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'version_group_details': instance.versionGroupDetails,
      'detail_move': instance.detailMove,
    };
