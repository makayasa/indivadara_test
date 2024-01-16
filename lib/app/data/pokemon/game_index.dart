import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'version.dart';

part 'game_index.g.dart';

@JsonSerializable()
class GameIndex {
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final Version? version;

  const GameIndex({this.gameIndex, this.version});

  @override
  String toString() => 'GameIndex(gameIndex: $gameIndex, version: $version)';

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return _$GameIndexFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);

  GameIndex copyWith({
    int? gameIndex,
    Version? version,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GameIndex) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => gameIndex.hashCode ^ version.hashCode;
}
