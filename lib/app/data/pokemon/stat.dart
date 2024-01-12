import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'stat.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat {
	@JsonKey(name: 'base_stat') 
	final int? baseStat;
	final int? effort;
	final Stat? stat;

	const Stat({this.baseStat, this.effort, this.stat});

	@override
	String toString() {
		return 'Stat(baseStat: $baseStat, effort: $effort, stat: $stat)';
	}

	factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

	Map<String, dynamic> toJson() => _$StatToJson(this);

	Stat copyWith({
		int? baseStat,
		int? effort,
		Stat? stat,
	}) {
		return Stat(
			baseStat: baseStat ?? this.baseStat,
			effort: effort ?? this.effort,
			stat: stat ?? this.stat,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Stat) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
