// lib/routes/app_routes.dart
import 'package:fetch_api_project/src/features/products/screens/main_screen.dart';
import 'package:get/get.dart';
import '../features/authentication/screen/onbording_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String onboarding = '/onboarding';
}

// lib/routes/app_pages.dart

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const MainScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
  ];
}
