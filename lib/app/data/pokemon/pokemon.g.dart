// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      abilities: (json['abilities'] as List<dynamic>?)
          // ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
          ?.map((e) => e is Ability ? e : Ability.fromJson(e))
          .toList(),
      baseExperience: json['base_experience'] as int?,
      forms: (json['forms'] as List<dynamic>?)?.map((e) => e is Form ? e : Form.fromJson(e as Map<String, dynamic>)).toList(),
      gameIndices: (json['game_indices'] as List<dynamic>?)?.map((e) => e is GameIndex ? e : GameIndex.fromJson(e as Map<String, dynamic>)).toList(),
      height: json['height'] as int?,
      heldItems: json['held_items'] as List<dynamic>?,
      id: json['id'] as int?,
      isDefault: json['is_default'] as bool?,
      locationAreaEncounters: json['location_area_encounters'] as String?,
      moves: (json['moves'] as List<dynamic>?)?.map((e) => e is Move ? e : Move.fromJson(e as Map<String, dynamic>)).toList(),
      name: json['name'] as String?,
      order: json['order'] as int?,
      pastAbilities: json['past_abilities'] as List<dynamic>?,
      pastTypes: json['past_types'] as List<dynamic>?,
      species: json['species'] == null
          ? null
          : json['species'] is Species
              ? json['species']
              : Species.fromJson(json['species'] as Map<String, dynamic>),
      sprites: json['sprites'] == null
          ? null
          : json['sprites'] is Sprites
              ? json['sprites']
              : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)?.map((e) => e is Stat ? e : Stat.fromJson(e as Map<String, dynamic>)).toList(),
      types: (json['types'] as List<dynamic>?)?.map((e) => e is Type ? e : Type.fromJson(e as Map<String, dynamic>)).toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'forms': instance.forms,
      'game_indices': instance.gameIndices,
      'height': instance.height,
      'held_items': instance.heldItems,
      'id': instance.id,
      'is_default': instance.isDefault,
      'location_area_encounters': instance.locationAreaEncounters,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'past_abilities': instance.pastAbilities,
      'past_types': instance.pastTypes,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };
