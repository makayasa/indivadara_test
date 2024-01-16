import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? gender;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  final String? job;
  final String? city;
  final String? zipcode;
  final double? latitude;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  final String? email;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'first_name')
  final String? firstName;
  final String? phone;
  final String? street;
  final String? state;
  final String? country;
  final double? longitude;

  const User({
    this.id,
    this.gender,
    this.dateOfBirth,
    this.job,
    this.city,
    this.zipcode,
    this.latitude,
    this.profilePicture,
    this.email,
    this.lastName,
    this.firstName,
    this.phone,
    this.street,
    this.state,
    this.country,
    this.longitude,
  });

  @override
  String toString() {
    return 'User(id: $id, gender: $gender, dateOfBirth: $dateOfBirth, job: $job, city: $city, zipcode: $zipcode, latitude: $latitude, profilePicture: $profilePicture, email: $email, lastName: $lastName, firstName: $firstName, phone: $phone, street: $street, state: $state, country: $country, longitude: $longitude)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? gender,
    String? dateOfBirth,
    String? job,
    String? city,
    String? zipcode,
    double? latitude,
    String? profilePicture,
    String? email,
    String? lastName,
    String? firstName,
    String? phone,
    String? street,
    String? state,
    String? country,
    double? longitude,
  }) {
    return User(
      id: id ?? this.id,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      job: job ?? this.job,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      latitude: latitude ?? this.latitude,
      profilePicture: profilePicture ?? this.profilePicture,
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      state: state ?? this.state,
      country: country ?? this.country,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      gender.hashCode ^
      dateOfBirth.hashCode ^
      job.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      latitude.hashCode ^
      profilePicture.hashCode ^
      email.hashCode ^
      lastName.hashCode ^
      firstName.hashCode ^
      phone.hashCode ^
      street.hashCode ^
      state.hashCode ^
      country.hashCode ^
      longitude.hashCode;
}
