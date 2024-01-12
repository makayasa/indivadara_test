import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'species.g.dart';

@JsonSerializable()
class Species {
	final String? name;
	final String? url;

	const Species({this.name, this.url});

	@override
	String toString() => 'Species(name: $name, url: $url)';

	factory Species.fromJson(Map<String, dynamic> json) {
		return _$SpeciesFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SpeciesToJson(this);

	Species copyWith({
		String? name,
		String? url,
	}) {
		return Species(
			name: name ?? this.name,
			url: url ?? this.url,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Species) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => name.hashCode ^ url.hashCode;
}
