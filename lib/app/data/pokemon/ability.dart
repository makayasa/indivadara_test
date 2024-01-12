import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability {
	final Ability? ability;
	@JsonKey(name: 'is_hidden') 
	final bool? isHidden;
	final int? slot;

	const Ability({this.ability, this.isHidden, this.slot});

	@override
	String toString() {
		return 'Ability(ability: $ability, isHidden: $isHidden, slot: $slot)';
	}

	factory Ability.fromJson(Map<String, dynamic> json) {
		return _$AbilityFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AbilityToJson(this);

	Ability copyWith({
		Ability? ability,
		bool? isHidden,
		int? slot,
	}) {
		return Ability(
			ability: ability ?? this.ability,
			isHidden: isHidden ?? this.isHidden,
			slot: slot ?? this.slot,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Ability) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => ability.hashCode ^ isHidden.hashCode ^ slot.hashCode;
}
