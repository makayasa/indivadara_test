import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'icons.dart';

part 'generation_viii.g.dart';

@JsonSerializable()
class GenerationViii {
  final Icons? icons;

  const GenerationViii({this.icons});

  @override
  String toString() => 'GenerationViii(icons: $icons)';

  factory GenerationViii.fromJson(Map<String, dynamic> json) {
    return _$GenerationViiiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationViiiToJson(this);

  GenerationViii copyWith({
    Icons? icons,
  }) {
    return GenerationViii(
      icons: icons ?? this.icons,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationViii) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => icons.hashCode;
}
