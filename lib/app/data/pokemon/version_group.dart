import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_group.g.dart';

@JsonSerializable()
class VersionGroup {
  final String? name;
  final String? url;

  const VersionGroup({this.name, this.url});

  @override
  String toString() => 'VersionGroup(name: $name, url: $url)';

  factory VersionGroup.fromJson(Map<String, dynamic> json) {
    return _$VersionGroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionGroupToJson(this);

  VersionGroup copyWith({
    String? name,
    String? url,
  }) {
    return VersionGroup(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VersionGroup) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
