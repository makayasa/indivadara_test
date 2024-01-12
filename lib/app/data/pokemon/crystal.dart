import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crystal.g.dart';

@JsonSerializable()
class Crystal {
	@JsonKey(name: 'back_default') 
	final String? backDefault;
	@JsonKey(name: 'back_shiny') 
	final String? backShiny;
	@JsonKey(name: 'back_shiny_transparent') 
	final String? backShinyTransparent;
	@JsonKey(name: 'back_transparent') 
	final String? backTransparent;
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;
	@JsonKey(name: 'front_shiny_transparent') 
	final String? frontShinyTransparent;
	@JsonKey(name: 'front_transparent') 
	final String? frontTransparent;

	const Crystal({
		this.backDefault, 
		this.backShiny, 
		this.backShinyTransparent, 
		this.backTransparent, 
		this.frontDefault, 
		this.frontShiny, 
		this.frontShinyTransparent, 
		this.frontTransparent, 
	});

	@override
	String toString() {
		return 'Crystal(backDefault: $backDefault, backShiny: $backShiny, backShinyTransparent: $backShinyTransparent, backTransparent: $backTransparent, frontDefault: $frontDefault, frontShiny: $frontShiny, frontShinyTransparent: $frontShinyTransparent, frontTransparent: $frontTransparent)';
	}

	factory Crystal.fromJson(Map<String, dynamic> json) {
		return _$CrystalFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CrystalToJson(this);

	Crystal copyWith({
		String? backDefault,
		String? backShiny,
		String? backShinyTransparent,
		String? backTransparent,
		String? frontDefault,
		String? frontShiny,
		String? frontShinyTransparent,
		String? frontTransparent,
	}) {
		return Crystal(
			backDefault: backDefault ?? this.backDefault,
			backShiny: backShiny ?? this.backShiny,
			backShinyTransparent: backShinyTransparent ?? this.backShinyTransparent,
			backTransparent: backTransparent ?? this.backTransparent,
			frontDefault: frontDefault ?? this.frontDefault,
			frontShiny: frontShiny ?? this.frontShiny,
			frontShinyTransparent: frontShinyTransparent ?? this.frontShinyTransparent,
			frontTransparent: frontTransparent ?? this.frontTransparent,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Crystal) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			backDefault.hashCode ^
			backShiny.hashCode ^
			backShinyTransparent.hashCode ^
			backTransparent.hashCode ^
			frontDefault.hashCode ^
			frontShiny.hashCode ^
			frontShinyTransparent.hashCode ^
			frontTransparent.hashCode;
}
