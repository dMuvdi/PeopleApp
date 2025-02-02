import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_app/app/screens/home_page/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          "People App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(Get.context!).unfocus();
                },
                onChanged: (value) => controller.searchTerm.value = value,
                decoration: const InputDecoration(
                  hintText: 'Search...', // Placeholder text
                  prefixIcon: Icon(Icons.search), // Search icon on the left
                  border: InputBorder.none, // Remove default border
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0), // Adjust padding as needed
                ),
              ),
            ),
            Obx(() => Container(
                  width: Get.width,
                  height: Get.height * 0.75,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: controller.filteredUserList.isEmpty ? const Center(child: Text("No se encuentran usuarios con a busqueda realizada"),) : ListView.builder(
                    itemCount: controller.filteredUserList.length,
                    padding: const EdgeInsets.only(top: 15.0),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                controller.filteredUserList[index].name,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                controller.filteredUserList[index].email,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Center(
                                  child: Text(
                                    controller.filteredUserList[index].name[0]
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                  right: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.phone),
                                          const SizedBox(
                                            width: 7.0,
                                          ),
                                          Text(controller
                                              .filteredUserList[index].phone),
                                        ],
                                      ),
                                      Text(
                                          "ext. ${controller.filteredUserList[index].phoneExt}")
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.brown),
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.brown.shade300),
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 10)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                3),
                                      ),
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Text(
                                            "Ver publicaciones",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                            color: Colors.white,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
