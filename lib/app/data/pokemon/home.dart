import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_female') 
	final dynamic frontFemale;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;
	@JsonKey(name: 'front_shiny_female') 
	final dynamic frontShinyFemale;

	const Home({
		this.frontDefault, 
		this.frontFemale, 
		this.frontShiny, 
		this.frontShinyFemale, 
	});

	@override
	String toString() {
		return 'Home(frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale)';
	}

	factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

	Map<String, dynamic> toJson() => _$HomeToJson(this);

	Home copyWith({
		String? frontDefault,
		dynamic frontFemale,
		String? frontShiny,
		dynamic frontShinyFemale,
	}) {
		return Home(
			frontDefault: frontDefault ?? this.frontDefault,
			frontFemale: frontFemale ?? this.frontFemale,
			frontShiny: frontShiny ?? this.frontShiny,
			frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Home) return false;
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
