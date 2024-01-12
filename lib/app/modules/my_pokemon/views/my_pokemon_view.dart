import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_pokemon_controller.dart';

class MyPokemonView extends GetView<MyPokemonController> {
  const MyPokemonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('MyPokemonView'),
      //   centerTitle: true,
      // ),
      body: const Center(
        child: Text(
          'MyPokemonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
