import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'crystal.dart';
import 'gold.dart';
import 'silver.dart';

part 'generation_ii.g.dart';

@JsonSerializable()
class GenerationIi {
	final Crystal? crystal;
	final Gold? gold;
	final Silver? silver;

	const GenerationIi({this.crystal, this.gold, this.silver});

	@override
	String toString() {
		return 'GenerationIi(crystal: $crystal, gold: $gold, silver: $silver)';
	}

	factory GenerationIi.fromJson(Map<String, dynamic> json) {
		return _$GenerationIiFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GenerationIiToJson(this);

	GenerationIi copyWith({
		Crystal? crystal,
		Gold? gold,
		Silver? silver,
	}) {
		return GenerationIi(
			crystal: crystal ?? this.crystal,
			gold: gold ?? this.gold,
			silver: silver ?? this.silver,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! GenerationIi) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => crystal.hashCode ^ gold.hashCode ^ silver.hashCode;
}
