import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'black_white.dart';

part 'generation_v.g.dart';

@JsonSerializable()
class GenerationV {
	@JsonKey(name: 'black-white') 
	final BlackWhite? blackWhite;

	const GenerationV({this.blackWhite});

	@override
	String toString() => 'GenerationV(blackWhite: $blackWhite)';

	factory GenerationV.fromJson(Map<String, dynamic> json) {
		return _$GenerationVFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GenerationVToJson(this);

	GenerationV copyWith({
		BlackWhite? blackWhite,
	}) {
		return GenerationV(
			blackWhite: blackWhite ?? this.blackWhite,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! GenerationV) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => blackWhite.hashCode;
}
