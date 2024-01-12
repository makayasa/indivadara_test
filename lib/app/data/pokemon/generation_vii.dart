import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'icons.dart';
import 'ultra_sun_ultra_moon.dart';

part 'generation_vii.g.dart';

@JsonSerializable()
class GenerationVii {
	final Icons? icons;
	@JsonKey(name: 'ultra-sun-ultra-moon') 
	final UltraSunUltraMoon? ultraSunUltraMoon;

	const GenerationVii({this.icons, this.ultraSunUltraMoon});

	@override
	String toString() {
		return 'GenerationVii(icons: $icons, ultraSunUltraMoon: $ultraSunUltraMoon)';
	}

	factory GenerationVii.fromJson(Map<String, dynamic> json) {
		return _$GenerationViiFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GenerationViiToJson(this);

	GenerationVii copyWith({
		Icons? icons,
		UltraSunUltraMoon? ultraSunUltraMoon,
	}) {
		return GenerationVii(
			icons: icons ?? this.icons,
			ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! GenerationVii) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => icons.hashCode ^ ultraSunUltraMoon.hashCode;
}
