// lib/controllers/onboarding_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../models/onboarding_model.dart';


class OnboardingController extends GetxController {
  var pageController = PageController();
  var currentPage = 0.obs;

  List<OnBoardingPageModel> onboardingPages = [
    OnBoardingPageModel(
      imageAsset: 'assets/images/image_1.png',
      title: 'Welcome',
      description: 'Welcome to our app!',
    ),
    OnBoardingPageModel(
      imageAsset: 'assets/images/image_2.png',
      title: 'Features',
      description: 'Discover great features.',
    ),
    OnBoardingPageModel(
      imageAsset: 'assets/images/image_3.png',
      title: 'Get Started',
      description: 'Let\'s get started!',
    ),
  ];

  bool get isLastPage => currentPage.value == onboardingPages.length - 1;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void completeOnboarding() {
    Get.offAllNamed(AppRoutes.home);
  }
}
