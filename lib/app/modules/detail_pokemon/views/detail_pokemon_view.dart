import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_pokemon_controller.dart';

class DetailPokemonView extends GetView<DetailPokemonController> {
  const DetailPokemonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPokemonView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailPokemonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
