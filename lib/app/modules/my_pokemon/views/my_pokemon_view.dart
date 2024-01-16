import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';
import '../../../../config/environment.dart';
import '../../../components/default_text.dart';
import '../controllers/my_pokemon_controller.dart';

class MyPokemonView extends GetView<MyPokemonController> {
  const MyPokemonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MyPokemonController());
    return Scaffold(
      body: Obx(
        () => GridView.builder(
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: controller.myPokemons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final id = controller.myPokemons[index].id;
            String capitalized = controller.myPokemons[index].name ?? '';
            return GestureDetector(
              onTap: () {
                controller.detailMyPokemon(index);
              },
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: kDefaultBorderRadius10,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: kBgWhite,
                              borderRadius: kDefaultBorderRadius10,
                            ),
                            child: Hero(
                              tag: '${controller.myPokemons[index].id}',
                              child: CachedNetworkImage(
                                  imageUrl: '$imageBaseUrl/$id.png'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        DefText(
                          // controller.myPokemons[index]['name'],
                          capitalized.capitalizeFirst!,
                          color: kBgWhite,
                        ).semilarge,
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => controller.deletePokomen(index),
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kInactiveColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: kBgWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
