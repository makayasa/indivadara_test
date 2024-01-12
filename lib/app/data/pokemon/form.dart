import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form.g.dart';

@JsonSerializable()
class Form {
	final String? name;
	final String? url;

	const Form({this.name, this.url});

	@override
	String toString() => 'Form(name: $name, url: $url)';

	factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

	Map<String, dynamic> toJson() => _$FormToJson(this);

	Form copyWith({
		String? name,
		String? url,
	}) {
		return Form(
			name: name ?? this.name,
			url: url ?? this.url,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Form) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => name.hashCode ^ url.hashCode;
}
