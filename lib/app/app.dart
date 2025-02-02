import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/utils/routes/pages.dart';
import '../src/utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown,),
        useMaterial3: true,
      ),
      defaultTransition: Transition.fadeIn,
      navigatorKey: Get.key,
      transitionDuration: const Duration(milliseconds: 300 ),
      debugShowCheckedModeBanner: true, // Remove the debug banner
      title: 'PersonApp',
      initialRoute: MainRoutes.splash,
      getPages: Pages.pagesList,
    );
  }
}