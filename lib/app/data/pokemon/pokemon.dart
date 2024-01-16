import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'form.dart';
import 'game_index.dart';
import 'move.dart';
import 'species.dart';
import 'sprites.dart';
import 'stat.dart';
import 'type.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final List<Ability>? abilities;
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  final List<Form>? forms;
  @JsonKey(name: 'game_indices')
  final List<GameIndex>? gameIndices;
  final int? height;
  @JsonKey(name: 'held_items')
  final List<dynamic>? heldItems;
  final int? id;
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  @JsonKey(name: 'location_area_encounters')
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  @JsonKey(name: 'past_abilities')
  final List<dynamic>? pastAbilities;
  @JsonKey(name: 'past_types')
  final List<dynamic>? pastTypes;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final int? weight;

  const Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastAbilities,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  @override
  String toString() {
    return 'Pokemon(abilities: $abilities, baseExperience: $baseExperience, forms: $forms, gameIndices: $gameIndices, height: $height, heldItems: $heldItems, id: $id, isDefault: $isDefault, locationAreaEncounters: $locationAreaEncounters, moves: $moves, name: $name, order: $order, pastAbilities: $pastAbilities, pastTypes: $pastTypes, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return _$PokemonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  Pokemon copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Form>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    List<dynamic>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastAbilities,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) {
    return Pokemon(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      forms: forms ?? this.forms,
      gameIndices: gameIndices ?? this.gameIndices,
      height: height ?? this.height,
      heldItems: heldItems ?? this.heldItems,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      locationAreaEncounters:
          locationAreaEncounters ?? this.locationAreaEncounters,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      order: order ?? this.order,
      pastAbilities: pastAbilities ?? this.pastAbilities,
      pastTypes: pastTypes ?? this.pastTypes,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Pokemon) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      abilities.hashCode ^
      baseExperience.hashCode ^
      forms.hashCode ^
      gameIndices.hashCode ^
      height.hashCode ^
      heldItems.hashCode ^
      id.hashCode ^
      isDefault.hashCode ^
      locationAreaEncounters.hashCode ^
      moves.hashCode ^
      name.hashCode ^
      order.hashCode ^
      pastAbilities.hashCode ^
      pastTypes.hashCode ^
      species.hashCode ^
      sprites.hashCode ^
      stats.hashCode ^
      types.hashCode ^
      weight.hashCode;
}
