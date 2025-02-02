import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
              backgroundColor: Colors.brown,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.diversity_3_rounded, size: 90, color: Colors.white,),
                  const SizedBox(height: 7.0,),
                  const Text("People App", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 95.0, vertical: 7.0),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.brown.shade500),
                    ),
                  ),
                ],
              )
            );
      }
    );
  }
}