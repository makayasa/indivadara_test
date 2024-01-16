import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icons.g.dart';

@JsonSerializable()
class Icons {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final dynamic frontFemale;

  const Icons({this.frontDefault, this.frontFemale});

  @override
  String toString() {
    return 'Icons(frontDefault: $frontDefault, frontFemale: $frontFemale)';
  }

  factory Icons.fromJson(Map<String, dynamic> json) => _$IconsFromJson(json);

  Map<String, dynamic> toJson() => _$IconsToJson(this);

  Icons copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) {
    return Icons(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Icons) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontFemale.hashCode;
}
