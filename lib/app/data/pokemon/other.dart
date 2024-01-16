import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dream_world.dart';
import 'home.dart';
import 'official_artwork.dart';
import 'showdown.dart';

part 'other.g.dart';

@JsonSerializable()
class Other {
  @JsonKey(name: 'dream_world')
  final DreamWorld? dreamWorld;
  final Home? home;
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;
  final Showdown? showdown;

  const Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
    this.showdown,
  });

  @override
  String toString() {
    return 'Other(dreamWorld: $dreamWorld, home: $home, officialArtwork: $officialArtwork, showdown: $showdown)';
  }

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
    Showdown? showdown,
  }) {
    return Other(
      dreamWorld: dreamWorld ?? this.dreamWorld,
      home: home ?? this.home,
      officialArtwork: officialArtwork ?? this.officialArtwork,
      showdown: showdown ?? this.showdown,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Other) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      dreamWorld.hashCode ^
      home.hashCode ^
      officialArtwork.hashCode ^
      showdown.hashCode;
}
