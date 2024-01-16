import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'detail_move.dart';
import 'version_group_detail.dart';

part 'move.g.dart';

@JsonSerializable()
class Move {
  @JsonKey(name: 'version_group_details')
  final List<VersionGroupDetail>? versionGroupDetails;
  @JsonKey(name: 'detail_move')
  final DetailMove? detailMove;

  const Move({this.versionGroupDetails, this.detailMove});

  @override
  String toString() {
    return 'Move(versionGroupDetails: $versionGroupDetails, detailMove: $detailMove)';
  }

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);

  Move copyWith({
    List<VersionGroupDetail>? versionGroupDetails,
    DetailMove? detailMove,
  }) {
    return Move(
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      detailMove: detailMove ?? this.detailMove,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Move) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => versionGroupDetails.hashCode ^ detailMove.hashCode;
}
