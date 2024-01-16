import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'red_blue.dart';
import 'yellow.dart';

part 'generation_i.g.dart';

@JsonSerializable()
class GenerationI {
  @JsonKey(name: 'red-blue')
  final RedBlue? redBlue;
  final Yellow? yellow;

  const GenerationI({this.redBlue, this.yellow});

  @override
  String toString() => 'GenerationI(redBlue: $redBlue, yellow: $yellow)';

  factory GenerationI.fromJson(Map<String, dynamic> json) {
    return _$GenerationIFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationIToJson(this);

  GenerationI copyWith({
    RedBlue? redBlue,
    Yellow? yellow,
  }) {
    return GenerationI(
      redBlue: redBlue ?? this.redBlue,
      yellow: yellow ?? this.yellow,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationI) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => redBlue.hashCode ^ yellow.hashCode;
}
