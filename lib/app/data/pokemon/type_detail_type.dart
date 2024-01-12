import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';


part 'type_detail_type.g.dart';

@JsonSerializable()
class DetailType {
  // final int? slot;
  // final DetailType? type;

  final String? name;
  final String? url;

  const DetailType({this.name, this.url});

  @override
  String toString() => 'DetailType(slot: $name, type: $url)';

  factory DetailType.fromJson(Map<String, dynamic> json) => _$DetailTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTypeToJson(this);

  DetailType copyWith({
    int? slot,
    DetailType? type,
  }) {
    return DetailType(
      name: name ?? name,
      url: url ?? url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DetailType) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
