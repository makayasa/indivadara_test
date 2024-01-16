import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'red_blue.g.dart';

@JsonSerializable()
class RedBlue {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_gray')
  final String? backGray;
  @JsonKey(name: 'back_transparent')
  final String? backTransparent;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_gray')
  final String? frontGray;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  const RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  @override
  String toString() {
    return 'RedBlue(backDefault: $backDefault, backGray: $backGray, backTransparent: $backTransparent, frontDefault: $frontDefault, frontGray: $frontGray, frontTransparent: $frontTransparent)';
  }

  factory RedBlue.fromJson(Map<String, dynamic> json) {
    return _$RedBlueFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RedBlueToJson(this);

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? backTransparent,
    String? frontDefault,
    String? frontGray,
    String? frontTransparent,
  }) {
    return RedBlue(
      backDefault: backDefault ?? this.backDefault,
      backGray: backGray ?? this.backGray,
      backTransparent: backTransparent ?? this.backTransparent,
      frontDefault: frontDefault ?? this.frontDefault,
      frontGray: frontGray ?? this.frontGray,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RedBlue) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backGray.hashCode ^
      backTransparent.hashCode ^
      frontDefault.hashCode ^
      frontGray.hashCode ^
      frontTransparent.hashCode;
}
