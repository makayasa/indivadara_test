import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'generation_i.dart';
import 'generation_ii.dart';
import 'generation_iii.dart';
import 'generation_iv.dart';
import 'generation_v.dart';
import 'generation_vi.dart';
import 'generation_vii.dart';
import 'generation_viii.dart';

part 'versions.g.dart';

@JsonSerializable()
class Versions {
  @JsonKey(name: 'generation-i')
  final GenerationI? generationI;
  @JsonKey(name: 'generation-ii')
  final GenerationIi? generationIi;
  @JsonKey(name: 'generation-iii')
  final GenerationIii? generationIii;
  @JsonKey(name: 'generation-iv')
  final GenerationIv? generationIv;
  @JsonKey(name: 'generation-v')
  final GenerationV? generationV;
  @JsonKey(name: 'generation-vi')
  final GenerationVi? generationVi;
  @JsonKey(name: 'generation-vii')
  final GenerationVii? generationVii;
  @JsonKey(name: 'generation-viii')
  final GenerationViii? generationViii;

  const Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  @override
  String toString() {
    return 'Versions(generationI: $generationI, generationIi: $generationIi, generationIii: $generationIii, generationIv: $generationIv, generationV: $generationV, generationVi: $generationVi, generationVii: $generationVii, generationViii: $generationViii)';
  }

  factory Versions.fromJson(Map<String, dynamic> json) {
    return _$VersionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionsToJson(this);

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    GenerationVi? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) {
    return Versions(
      generationI: generationI ?? this.generationI,
      generationIi: generationIi ?? this.generationIi,
      generationIii: generationIii ?? this.generationIii,
      generationIv: generationIv ?? this.generationIv,
      generationV: generationV ?? this.generationV,
      generationVi: generationVi ?? this.generationVi,
      generationVii: generationVii ?? this.generationVii,
      generationViii: generationViii ?? this.generationViii,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Versions) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      generationI.hashCode ^
      generationIi.hashCode ^
      generationIii.hashCode ^
      generationIv.hashCode ^
      generationV.hashCode ^
      generationVi.hashCode ^
      generationVii.hashCode ^
      generationViii.hashCode;
}
