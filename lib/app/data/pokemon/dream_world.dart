import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dream_world.g.dart';

@JsonSerializable()
class DreamWorld {
	@JsonKey(name: 'front_default') 
	final String? frontDefault;
	@JsonKey(name: 'front_female') 
	final dynamic frontFemale;

	const DreamWorld({this.frontDefault, this.frontFemale});

	@override
	String toString() {
		return 'DreamWorld(frontDefault: $frontDefault, frontFemale: $frontFemale)';
	}

	factory DreamWorld.fromJson(Map<String, dynamic> json) {
		return _$DreamWorldFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DreamWorldToJson(this);

	DreamWorld copyWith({
		String? frontDefault,
		dynamic frontFemale,
	}) {
		return DreamWorld(
			frontDefault: frontDefault ?? this.frontDefault,
			frontFemale: frontFemale ?? this.frontFemale,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! DreamWorld) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => frontDefault.hashCode ^ frontFemale.hashCode;
}
