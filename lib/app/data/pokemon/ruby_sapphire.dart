import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ruby_sapphire.g.dart';

@JsonSerializable()
class RubySapphire {
	@JsonKey(name: 'back_default') 
	final String? backDefault;
	@JsonKey(name: 'back_shiny') 
	final String? backShiny;
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;

	const RubySapphire({
		this.backDefault, 
		this.backShiny, 
		this.frontDefault, 
		this.frontShiny, 
	});

	@override
	String toString() {
		return 'RubySapphire(backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny)';
	}

	factory RubySapphire.fromJson(Map<String, dynamic> json) {
		return _$RubySapphireFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RubySapphireToJson(this);

	RubySapphire copyWith({
		String? backDefault,
		String? backShiny,
		String? frontDefault,
		String? frontShiny,
	}) {
		return RubySapphire(
			backDefault: backDefault ?? this.backDefault,
			backShiny: backShiny ?? this.backShiny,
			frontDefault: frontDefault ?? this.frontDefault,
			frontShiny: frontShiny ?? this.frontShiny,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! RubySapphire) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			backDefault.hashCode ^
			backShiny.hashCode ^
			frontDefault.hashCode ^
			frontShiny.hashCode;
}
