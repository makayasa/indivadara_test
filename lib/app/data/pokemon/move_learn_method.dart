import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_learn_method.g.dart';

@JsonSerializable()
class MoveLearnMethod {
  final String? name;
  final String? url;

  const MoveLearnMethod({this.name, this.url});

  @override
  String toString() => 'MoveLearnMethod(name: $name, url: $url)';

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    return _$MoveLearnMethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoveLearnMethodToJson(this);

  MoveLearnMethod copyWith({
    String? name,
    String? url,
  }) {
    return MoveLearnMethod(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MoveLearnMethod) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
