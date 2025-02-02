import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:people_app/src/services/data_service.dart';

import '../../../src/models/user.dart';
import '../../../src/utils/routes/routes.dart';

class SplashController extends GetxController {

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  onInit() async {
    super.onInit();
    bool isFirstTime = await _checkFirstLaunch();
    if (isFirstTime){
      await storage.write(key: 'users', value: '');
    }
    startApp();
  }

  Future<bool> _checkFirstLaunch() async {
    try {
      final value = await storage.read(key: 'first_time');
      if (value != null) {
        return false; // Not the first time
      } else {
        await storage.write(key: 'first_time', value: 'false'); // Mark as not first time for future launches
        return true;
      }
    } catch (e) {
      debugPrint("Error checking first launch: $e");
      // Handle error appropriately, e.g., set _isFirstTime to false or show a message.
      return false; // Default to not first time in case of error
    }
  }

  Future<void> startApp() async {
    
    String? stringOfItems = await storage.read(key: 'users');

    switch (stringOfItems!.isEmpty){
      case true:
        List<User> userList = await DataService.getUsers();
        List<String> userString = userList.map((e) => jsonEncode(e.toJson())).toList();
        await storage.write(key: 'users', value: jsonEncode(userString));
        await Get.offAllNamed(MainRoutes.home, arguments: {'users':userList});
      case false:
        List<dynamic> userString = jsonDecode(stringOfItems);
        List<User> userList = userString.map((json) => User.fromJson(jsonDecode(json))).toList();
        await Get.offAllNamed(MainRoutes.home, arguments: {'users':userList});
    }
  }
}
