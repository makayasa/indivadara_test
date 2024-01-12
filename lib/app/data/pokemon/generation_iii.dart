import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'emerald.dart';
import 'firered_leafgreen.dart';
import 'ruby_sapphire.dart';

part 'generation_iii.g.dart';

@JsonSerializable()
class GenerationIii {
	final Emerald? emerald;
	@JsonKey(name: 'firered-leafgreen') 
	final FireredLeafgreen? fireredLeafgreen;
	@JsonKey(name: 'ruby-sapphire') 
	final RubySapphire? rubySapphire;

	const GenerationIii({
		this.emerald, 
		this.fireredLeafgreen, 
		this.rubySapphire, 
	});

	@override
	String toString() {
		return 'GenerationIii(emerald: $emerald, fireredLeafgreen: $fireredLeafgreen, rubySapphire: $rubySapphire)';
	}

	factory GenerationIii.fromJson(Map<String, dynamic> json) {
		return _$GenerationIiiFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GenerationIiiToJson(this);

	GenerationIii copyWith({
		Emerald? emerald,
		FireredLeafgreen? fireredLeafgreen,
		RubySapphire? rubySapphire,
	}) {
		return GenerationIii(
			emerald: emerald ?? this.emerald,
			fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
			rubySapphire: rubySapphire ?? this.rubySapphire,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! GenerationIii) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			emerald.hashCode ^
			fireredLeafgreen.hashCode ^
			rubySapphire.hashCode;
}
