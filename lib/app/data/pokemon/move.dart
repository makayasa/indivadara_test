import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'move.dart';
import 'version_group_detail.dart';

part 'move.g.dart';

@JsonSerializable()
class Move {
	final Move? move;
	@JsonKey(name: 'version_group_details') 
	final List<VersionGroupDetail>? versionGroupDetails;

	const Move({this.move, this.versionGroupDetails});

	@override
	String toString() {
		return 'Move(move: $move, versionGroupDetails: $versionGroupDetails)';
	}

	factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

	Map<String, dynamic> toJson() => _$MoveToJson(this);

	Move copyWith({
		Move? move,
		List<VersionGroupDetail>? versionGroupDetails,
	}) {
		return Move(
			move: move ?? this.move,
			versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Move) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => move.hashCode ^ versionGroupDetails.hashCode;
}
