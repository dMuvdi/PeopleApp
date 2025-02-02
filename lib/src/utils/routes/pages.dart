import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../app/screens/home_page/home_page.dart';
import '../../../app/screens/home_page/home_page_binding.dart';
import '../../../app/screens/person_detail_page/person_detail_binding.dart';
import '../../../app/screens/person_detail_page/person_detail_screen.dart';
import '../../../app/screens/splash_screen/splash_binding.dart';
import '../../../app/screens/splash_screen/splash_screen.dart';
import 'routes.dart';

abstract class Pages {
  static final pagesList = [
    GetPage(
      name: MainRoutes.splash, 
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut
    ),
    GetPage(
      name: MainRoutes.home, 
      page: () => const HomePage(),
      binding: HomePageBinding(),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut
    ),
    GetPage(
      name: MainRoutes.peopleDetail,
      page: () => const PeopleDetailScreen(),
      binding: PeopleDetailBinding(),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut
    ),
  ];
}