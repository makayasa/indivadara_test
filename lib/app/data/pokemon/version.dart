import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class Version {
  final String? name;
  final String? url;

  const Version({this.name, this.url});

  @override
  String toString() => 'Version(name: $name, url: $url)';

  factory Version.fromJson(Map<String, dynamic> json) {
    return _$VersionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  Version copyWith({
    String? name,
    String? url,
  }) {
    return Version(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Version) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
