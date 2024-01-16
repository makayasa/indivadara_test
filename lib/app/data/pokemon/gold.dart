import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gold.g.dart';

@JsonSerializable()
class Gold {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  const Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  @override
  String toString() {
    return 'Gold(backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny, frontTransparent: $frontTransparent)';
  }

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String, dynamic> toJson() => _$GoldToJson(this);

  Gold copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
    String? frontTransparent,
  }) {
    return Gold(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Gold) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backShiny.hashCode ^
      frontDefault.hashCode ^
      frontShiny.hashCode ^
      frontTransparent.hashCode;
}
