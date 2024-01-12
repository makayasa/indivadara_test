import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'official_artwork.g.dart';

@JsonSerializable()
class OfficialArtwork {
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_shiny') 
	final String? frontShiny;

	const OfficialArtwork({this.frontDefault, this.frontShiny});

	@override
	String toString() {
		return 'OfficialArtwork(frontDefault: $frontDefault, frontShiny: $frontShiny)';
	}

	factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
		return _$OfficialArtworkFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);

	OfficialArtwork copyWith({
		String? frontDefault,
		String? frontShiny,
	}) {
		return OfficialArtwork(
			frontDefault: frontDefault ?? this.frontDefault,
			frontShiny: frontShiny ?? this.frontShiny,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! OfficialArtwork) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => frontDefault.hashCode ^ frontShiny.hashCode;
}
