import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'diamond_pearl.dart';
import 'heartgold_soulsilver.dart';
import 'platinum.dart';

part 'generation_iv.g.dart';

@JsonSerializable()
class GenerationIv {
  @JsonKey(name: 'diamond-pearl')
  final DiamondPearl? diamondPearl;
  @JsonKey(name: 'heartgold-soulsilver')
  final HeartgoldSoulsilver? heartgoldSoulsilver;
  final Platinum? platinum;

  const GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  @override
  String toString() {
    return 'GenerationIv(diamondPearl: $diamondPearl, heartgoldSoulsilver: $heartgoldSoulsilver, platinum: $platinum)';
  }

  factory GenerationIv.fromJson(Map<String, dynamic> json) {
    return _$GenerationIvFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationIvToJson(this);

  GenerationIv copyWith({
    DiamondPearl? diamondPearl,
    HeartgoldSoulsilver? heartgoldSoulsilver,
    Platinum? platinum,
  }) {
    return GenerationIv(
      diamondPearl: diamondPearl ?? this.diamondPearl,
      heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
      platinum: platinum ?? this.platinum,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationIv) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      diamondPearl.hashCode ^ heartgoldSoulsilver.hashCode ^ platinum.hashCode;
}
