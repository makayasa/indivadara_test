import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'move_learn_method.dart';
import 'version_group.dart';

part 'version_group_detail.g.dart';

@JsonSerializable()
class VersionGroupDetail {
	@JsonKey(name: 'level_learned_at') 
	final int? levelLearnedAt;
	@JsonKey(name: 'move_learn_method') 
	final MoveLearnMethod? moveLearnMethod;
	@JsonKey(name: 'version_group') 
	final VersionGroup? versionGroup;

	const VersionGroupDetail({
		this.levelLearnedAt, 
		this.moveLearnMethod, 
		this.versionGroup, 
	});

	@override
	String toString() {
		return 'VersionGroupDetail(levelLearnedAt: $levelLearnedAt, moveLearnMethod: $moveLearnMethod, versionGroup: $versionGroup)';
	}

	factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
		return _$VersionGroupDetailFromJson(json);
	}

	Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);

	VersionGroupDetail copyWith({
		int? levelLearnedAt,
		MoveLearnMethod? moveLearnMethod,
		VersionGroup? versionGroup,
	}) {
		return VersionGroupDetail(
			levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
			moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
			versionGroup: versionGroup ?? this.versionGroup,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! VersionGroupDetail) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			levelLearnedAt.hashCode ^
			moveLearnMethod.hashCode ^
			versionGroup.hashCode;
}
