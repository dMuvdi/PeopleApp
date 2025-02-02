import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'person_detail_controller.dart';

class PeopleDetailScreen extends GetView<PeopleDetailController> {
  const PeopleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: const Text(
          "People App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
                child: Center(
                  child: Text(
                    controller.name[0].toUpperCase(),
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                controller.name,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              Text(
                controller.email,
                style: const TextStyle(fontSize: 15.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(
                    width: 7.0,
                  ),
                  Text(controller.phone),
                ],
              ),
              Text("ext. ${controller.phoneExt}"),
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Publicaciones:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Obx(() => SizedBox(
                    width: Get.width,
                    height: Get.height * 0.55,
                    child: controller.postList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            itemCount: controller.postList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.white60,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.postList[index].title,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        controller.postList[index].content,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
