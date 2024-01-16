import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indivara_test/app/components/default_text.dart';

import '../controllers/sample_controller.dart';

class SampleView extends GetView<SampleController> {
  const SampleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SampleController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('SampleView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          itemCount: controller.listUsers.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        imageUrl: controller.listUsers[index].profilePicture ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefText(
                        '${controller.listUsers[index].firstName} ${controller.listUsers[index].lastName} | ${controller.listUsers[index].gender}',
                      ).semilarge,
                      DefText(
                        '${controller.listUsers[index].email}',
                      ).semiSmall,
                      DefText(
                        '${controller.listUsers[index].phone}',
                      ).semiSmall,
                    ],
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
