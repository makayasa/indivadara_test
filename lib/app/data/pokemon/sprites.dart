import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'other.dart';
import 'versions.dart';

part 'sprites.g.dart';

@JsonSerializable()
class Sprites {
	@JsonKey(name: 'back_default') 
	final String? backDefault;
	@JsonKey(name: 'back_female') 
	final dynamic backFemale;
	@JsonKey(name: 'back_shiny') 
	final String? backShiny;
	@JsonKey(name: 'back_shiny_female') 
	final dynamic backShinyFemale;
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_female') 
	final dynamic frontFemale;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;
	@JsonKey(name: 'front_shiny_female') 
	final dynamic frontShinyFemale;
	final Other? other;
	final Versions? versions;

	const Sprites({
		this.backDefault, 
		this.backFemale, 
		this.backShiny, 
		this.backShinyFemale, 
		this.frontDefault, 
		this.frontFemale, 
		this.frontShiny, 
		this.frontShinyFemale, 
		this.other, 
		this.versions, 
	});

	@override
	String toString() {
		return 'Sprites(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale, other: $other, versions: $versions)';
	}

	factory Sprites.fromJson(Map<String, dynamic> json) {
		return _$SpritesFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SpritesToJson(this);

	Sprites copyWith({
		String? backDefault,
		dynamic backFemale,
		String? backShiny,
		dynamic backShinyFemale,
		String? frontDefault,
		dynamic frontFemale,
		String? frontShiny,
		dynamic frontShinyFemale,
		Other? other,
		Versions? versions,
	}) {
		return Sprites(
			backDefault: backDefault ?? this.backDefault,
			backFemale: backFemale ?? this.backFemale,
			backShiny: backShiny ?? this.backShiny,
			backShinyFemale: backShinyFemale ?? this.backShinyFemale,
			frontDefault: frontDefault ?? this.frontDefault,
			frontFemale: frontFemale ?? this.frontFemale,
			frontShiny: frontShiny ?? this.frontShiny,
			frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
			other: other ?? this.other,
			versions: versions ?? this.versions,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Sprites) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			backDefault.hashCode ^
			backFemale.hashCode ^
			backShiny.hashCode ^
			backShinyFemale.hashCode ^
			frontDefault.hashCode ^
			frontFemale.hashCode ^
			frontShiny.hashCode ^
			frontShinyFemale.hashCode ^
			other.hashCode ^
			versions.hashCode;
}
