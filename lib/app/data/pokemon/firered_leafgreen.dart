import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firered_leafgreen.g.dart';

@JsonSerializable()
class FireredLeafgreen {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  const FireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  @override
  String toString() {
    return 'FireredLeafgreen(backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny)';
  }

  factory FireredLeafgreen.fromJson(Map<String, dynamic> json) {
    return _$FireredLeafgreenFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FireredLeafgreenToJson(this);

  FireredLeafgreen copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) {
    return FireredLeafgreen(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FireredLeafgreen) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backShiny.hashCode ^
      frontDefault.hashCode ^
      frontShiny.hashCode;
}
