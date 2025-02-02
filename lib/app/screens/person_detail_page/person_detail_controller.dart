import 'package:get/get.dart';
import 'package:people_app/src/services/data_service.dart';

import '../../../src/models/post.dart';

class PeopleDetailController extends GetxController {
  RxList<Post> postList = <Post>[].obs;
  final String name = Get.arguments['name'];
  final String email = Get.arguments['email'];
  final String phone = Get.arguments['phone'];
  final String phoneExt = Get.arguments['phone_ext'];

  @override
  void onInit() async {
    super.onInit();
    postList.value = await DataService.getPosts(Get.arguments['user_id']);
  }
}
