// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      job: json['job'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      profilePicture: json['profile_picture'] as String?,
      email: json['email'] as String?,
      lastName: json['last_name'] as String?,
      firstName: json['first_name'] as String?,
      phone: json['phone'] as String?,
      street: json['street'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'job': instance.job,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'latitude': instance.latitude,
      'profile_picture': instance.profilePicture,
      'email': instance.email,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'phone': instance.phone,
      'street': instance.street,
      'state': instance.state,
      'country': instance.country,
      'longitude': instance.longitude,
    };
