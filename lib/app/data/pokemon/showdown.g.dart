// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Showdown _$ShowdownFromJson(Map<String, dynamic> json) => Showdown(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'],
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'],
    );

Map<String, dynamic> _$ShowdownToJson(Showdown instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };
