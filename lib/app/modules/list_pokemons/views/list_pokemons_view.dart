import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indivara_test/app/components/default_text.dart';
import 'package:indivara_test/config/color_constants.dart';
import 'package:indivara_test/config/constant.dart';
import 'package:indivara_test/config/environment.dart';

import '../controllers/list_pokemons_controller.dart';

class ListPokemonsView extends GetView<ListPokemonsController> {
  const ListPokemonsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ListPokemonsController());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('ListPokemonsView'),
      //   centerTitle: true,
      // ),
      body: Obx(
        () => GridView.builder(
          addAutomaticKeepAlives: true,
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: controller.listPokemons.length,
          key: const PageStorageKey<String>('list_pokemons'),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final id = '${controller.listPokemons[index]['id']}';
            String capitalized = controller.listPokemons[index]['name'];
            return GestureDetector(
              onTap: () {
                controller.toDetailPokemon(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: kDefaultBorderRadius10,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: id,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: kBgWhite,
                            borderRadius: kDefaultBorderRadius10,
                          ),
                          child: CachedNetworkImage(imageUrl: '$imageBaseUrl/$id.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DefText(
                      // controller.listPokemons[index]['name'],
                      capitalized.capitalizeFirst!,
                      color: kBgWhite,
                    ).semilarge,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
