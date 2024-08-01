// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.onboardingPages[index].imageAsset),
                    Text(controller.onboardingPages[index].title),
                    Text(controller.onboardingPages[index].description),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25,bottom: 20),
            child: Obx(() => controller.isLastPage
                ? ElevatedButton(
                onPressed: controller.completeOnboarding,
                child: const Text("Get Started"),
              )
                : ElevatedButton(
                onPressed: controller.nextPage,
                child: const Text("Next")
              )
            ),
          ),
        ],
      ),
    );
  }
}
