import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'animated.g.dart';

@JsonSerializable()
class Animated {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final dynamic backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final dynamic backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final dynamic frontShinyFemale;

  const Animated({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  @override
  String toString() {
    return 'Animated(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale)';
  }

  factory Animated.fromJson(Map<String, dynamic> json) {
    return _$AnimatedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimatedToJson(this);

  Animated copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) {
    return Animated(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Animated) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backFemale.hashCode ^
      backShiny.hashCode ^
      backShinyFemale.hashCode ^
      frontDefault.hashCode ^
      frontFemale.hashCode ^
      frontShiny.hashCode ^
      frontShinyFemale.hashCode;
}
