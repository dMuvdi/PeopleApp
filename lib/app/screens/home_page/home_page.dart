import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:people_app/app/screens/home_page/home_page_controller.dart';

import 'widgets/person_card.dart';

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
                  child: controller.filteredUserList.isEmpty
                      ? const Center(
                          child: Text(
                              "No se encuentran usuarios con a busqueda realizada"),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredUserList.length,
                          padding: const EdgeInsets.only(top: 15.0),
                          itemBuilder: (context, index) {
                            return PersonCard(
                              name: controller.filteredUserList[index].name,
                              email: controller.filteredUserList[index].email,
                              phone: controller.filteredUserList[index].phone,
                              phoneExt:
                                  controller.filteredUserList[index].phoneExt,
                              onPressedSeePosts: (){
                                Get.toNamed(
                                  '/people_detail',
                                  arguments: {
                                    'name':controller.filteredUserList[index].name,
                                    'email':controller.filteredUserList[index].email,
                                    'phone':controller.filteredUserList[index].phone,
                                    'phone_ext':controller.filteredUserList[index].phoneExt,
                                    'user_id':controller.filteredUserList[index].id
                                  }
                                );
                              },
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
