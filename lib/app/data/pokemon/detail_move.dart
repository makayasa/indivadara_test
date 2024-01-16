import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_move.g.dart';

@JsonSerializable()
class DetailMove {
  final String? name;
  final String? url;

  const DetailMove({this.name, this.url});

  @override
  String toString() => 'DetailMove(name: $name, url: $url)';

  factory DetailMove.fromJson(Map<String, dynamic> json) {
    return _$DetailMoveFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailMoveToJson(this);

  DetailMove copyWith({
    String? name,
    String? url,
  }) {
    return DetailMove(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DetailMove) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
