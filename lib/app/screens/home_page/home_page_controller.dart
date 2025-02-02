import 'package:get/get.dart';

import '../../../src/models/user.dart';

class HomePageController extends GetxController {
  RxList<User> userList = <User>[].obs;
  RxList<User> filteredUserList = <User>[].obs;
  RxString searchTerm = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userList.value = Get.arguments['users'];
    filteredUserList.value = userList;
    ever(searchTerm, _filterUsers);
  }

  void _filterUsers(String text) {
    if (text.isEmpty) {
      filteredUserList.value = userList; // Reset to original list
    } else {
      filteredUserList.value = userList.where((user) =>
          user.name.toLowerCase().contains(text.toLowerCase())).toList();
    }
  }

  void getSearch(String value) {
    searchTerm.value = value;
  }
}
