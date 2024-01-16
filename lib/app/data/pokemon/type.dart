import 'package:collection/collection.dart';
import 'package:indivara_test/app/data/pokemon/type_detail_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type.g.dart';

@JsonSerializable()
class Type {
  final int? slot;
  final DetailType? type;

  const Type({this.slot, this.type});

  @override
  String toString() => 'Type(slot: $slot, type: $type)';

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  Type copyWith({
    int? slot,
    DetailType? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Type) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
