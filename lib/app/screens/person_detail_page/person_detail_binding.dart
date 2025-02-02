import 'package:get/get.dart';

import 'person_detail_controller.dart';


class PeopleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeopleDetailController>(
      () => PeopleDetailController(),
    );
  }
}