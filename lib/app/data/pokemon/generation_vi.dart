import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'omegaruby_alphasapphire.dart';
import 'xy.dart';

part 'generation_vi.g.dart';

@JsonSerializable()
class GenerationVi {
	@JsonKey(name: 'omegaruby-alphasapphire') 
	final OmegarubyAlphasapphire? omegarubyAlphasapphire;
	final Xy? xy;

	const GenerationVi({this.omegarubyAlphasapphire, this.xy});

	@override
	String toString() {
		return 'GenerationVi(omegarubyAlphasapphire: $omegarubyAlphasapphire, xy: $xy)';
	}

	factory GenerationVi.fromJson(Map<String, dynamic> json) {
		return _$GenerationViFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GenerationViToJson(this);

	GenerationVi copyWith({
		OmegarubyAlphasapphire? omegarubyAlphasapphire,
		Xy? xy,
	}) {
		return GenerationVi(
			omegarubyAlphasapphire: omegarubyAlphasapphire ?? this.omegarubyAlphasapphire,
			xy: xy ?? this.xy,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! GenerationVi) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => omegarubyAlphasapphire.hashCode ^ xy.hashCode;
}
