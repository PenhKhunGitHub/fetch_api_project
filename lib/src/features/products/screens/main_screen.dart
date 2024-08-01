import 'package:fetch_api_project/src/features/products/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/app_controller.dart';
import 'home_screen.dart';
import 'list_product_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List pages = [
      const HomeScreen(),
      const ListProductScreen(),
      const SettingScreen()
    ];
    final tabController = Get.put(AppController());

    return Scaffold(
      body: Obx(
        () => pages[tabController.currentIndex.value]
      ),
      bottomNavigationBar: Obx(
        ()=> SalomonBottomBar(
            onTap: (value) => tabController.onPageChange(value),
            currentIndex: tabController.currentIndex.value,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: const Color(0xff757575),
            items: _navBarItems
        ),
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite_border),
    title: const Text("Likes"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Search"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profile"),
    selectedColor: Colors.teal,
  ),
];