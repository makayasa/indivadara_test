import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indivara_test/app/components/default_chip.dart';
import 'package:indivara_test/app/components/default_text.dart';
import 'package:indivara_test/config/color_constants.dart';
import 'package:indivara_test/config/constant.dart';
import 'package:indivara_test/config/environment.dart';
import 'dart:math';

import '../../../../config/function_utils.dart';
import '../controllers/detail_pokemon_controller.dart';

class DetailPokemonView extends GetView<DetailPokemonController> {
  const DetailPokemonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailPokemonController());
    return Scaffold(
      backgroundColor: kBgWhite,
      floatingActionButton: FloatingActionButton.extended(
        icon: Image.asset(
          'assets/pokeball.png',
          height: 24,
          width: 24,
        ),
        label: DefText('Catch', color: kBgWhite).semilarge,
        onPressed: () {
          final a = Random().nextInt(2);
          logKey('a', a);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.mediaQuery.size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: [
                kElevationShadow(),
              ],
            ),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 200,
                ),
                child: CachedNetworkImage(
                  imageUrl: '$imageBaseUrl/${controller.id.value}.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => AnimatedCrossFade(
                crossFadeState: controller.isLoading.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: kDefaultFastDuration,
                layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
                  return topChild;
                },
                firstChild: const Center(
                  child: CircularProgressIndicator(),
                ),
                secondChild: Column(
                  children: [
                    Obx(
                      () => Align(
                        alignment: Alignment.center,
                        child: DefText(
                          // 'Venusauru',
                          (controller.data.value.name?.capitalizeFirst) ?? '',
                          fontWeight: FontWeight.bold,
                        ).extraLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: kDefaultScaffoldPadding,
                      child: Column(
                        children: [
                          Obx(
                            () => Container(
                              height: 35,
                              child: ListView.separated(
                                itemCount: controller.data.value.types?.length ?? 0,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 10);
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => DefaultChip(
                                      label: (controller.data.value.types?[index].type?.name?.capitalizeFirst) ?? '',
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Obx(
                                () => DefText('${controller.data.value.weight}', fontWeight: FontWeight.bold, color: kInactiveColor).semilarge,
                              ),
                              const Spacer(),
                              Obx(
                                () => DefText('${controller.data.value.height}', fontWeight: FontWeight.bold, color: kInactiveColor).semilarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              DefText(
                                'Weight',
                                fontWeight: FontWeight.bold,
                                color: kInactiveColor,
                              ).semilarge,
                              const Spacer(),
                              DefText(
                                'Height',
                                fontWeight: FontWeight.bold,
                                color: kInactiveColor,
                              ).semilarge,
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: kDefaultScaffoldPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefText(
                            'Moves',
                            fontWeight: FontWeight.bold,
                            color: kInactiveColor,
                          ).semilarge,
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 40,
                            child: Obx(
                              () => ListView.separated(
                                shrinkWrap: true,
                                // itemCount: 10,
                                itemCount: controller.data.value.moves?.length ?? 0,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 10);
                                },
                                itemBuilder: (context, index) {
                                  return DefaultChip(
                                    label: controller.data.value.moves![index].detailMove?.name ?? '',
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DetailPokemonStat(
                        label: 'HP',
                        stateValue: controller.data.value.stats?[0].baseStat?.toDouble() ?? 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DetailPokemonStat(
                        label: 'Attack',
                        stateValue: controller.data.value.stats?[1].baseStat?.toDouble() ?? 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DetailPokemonStat(
                        label: 'Defense',
                        stateValue: controller.data.value.stats?[2].baseStat?.toDouble() ?? 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DetailPokemonStat(
                        label: 'Special-attack',
                        stateValue: controller.data.value.stats?[3].baseStat?.toDouble() ?? 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DetailPokemonStat(
                        label: 'Special-deffense',
                        stateValue: controller.data.value.stats?[4].baseStat?.toDouble() ?? 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DetailPokemonStat(
                        label: 'Speed',
                        stateValue: controller.data.value.stats?[5].baseStat?.toDouble() ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPokemonStat extends GetView<DetailPokemonController> {
  const DetailPokemonStat({
    super.key,
    required this.label,
    this.stateValue = 0,
  });

  final String label;
  final double stateValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultScaffoldPadding,
      child: Row(
        children: [
          Expanded(
            child: DefText(label).semilarge,
          ),
          // const Spacer(),
          Expanded(
            child: Stack(
              children: [
                LinearProgressIndicator(
                  // value: (controller.data.value.stats?[0].baseStat?.toDouble() ?? 100) / 300,
                  value: stateValue / 300,
                  minHeight: 20,
                  borderRadius: kDefaultBorderRadius10,
                  backgroundColor: kInactiveColor2,
                  color: kPrimaryColor,
                  semanticsLabel: '123',
                ),
                Center(
                  child: DefText('${stateValue.toInt()} / 300').normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
