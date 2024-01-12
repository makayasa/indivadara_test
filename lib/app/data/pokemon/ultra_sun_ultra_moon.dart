import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ultra_sun_ultra_moon.g.dart';

@JsonSerializable()
class UltraSunUltraMoon {
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_female') 
	final dynamic frontFemale;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;
	@JsonKey(name: 'front_shiny_female') 
	final dynamic frontShinyFemale;

	const UltraSunUltraMoon({
		this.frontDefault, 
		this.frontFemale, 
		this.frontShiny, 
		this.frontShinyFemale, 
	});

	@override
	String toString() {
		return 'UltraSunUltraMoon(frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale)';
	}

	factory UltraSunUltraMoon.fromJson(Map<String, dynamic> json) {
		return _$UltraSunUltraMoonFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UltraSunUltraMoonToJson(this);

	UltraSunUltraMoon copyWith({
		String? frontDefault,
		dynamic frontFemale,
		String? frontShiny,
		dynamic frontShinyFemale,
	}) {
		return UltraSunUltraMoon(
			frontDefault: frontDefault ?? this.frontDefault,
			frontFemale: frontFemale ?? this.frontFemale,
			frontShiny: frontShiny ?? this.frontShiny,
			frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! UltraSunUltraMoon) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			frontDefault.hashCode ^
			frontFemale.hashCode ^
			frontShiny.hashCode ^
			frontShinyFemale.hashCode;
}
