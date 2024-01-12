import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emerald.g.dart';

@JsonSerializable()
class Emerald {
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;

	const Emerald({this.frontDefault, this.frontShiny});

	@override
	String toString() {
		return 'Emerald(frontDefault: $frontDefault, frontShiny: $frontShiny)';
	}

	factory Emerald.fromJson(Map<String, dynamic> json) {
		return _$EmeraldFromJson(json);
	}

	Map<String, dynamic> toJson() => _$EmeraldToJson(this);

	Emerald copyWith({
		String? frontDefault,
		String? frontShiny,
	}) {
		return Emerald(
			frontDefault: frontDefault ?? this.frontDefault,
			frontShiny: frontShiny ?? this.frontShiny,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Emerald) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => frontDefault.hashCode ^ frontShiny.hashCode;
}
