
import 'package:fetch_api_project/controllers/app_controller.dart';
import 'package:fetch_api_project/screens/home_screen.dart';
import 'package:fetch_api_project/screens/list_product_sreen.dart';
import 'package:fetch_api_project/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        ()=> BottomNavigationBar(
          onTap: (value) => tabController.chageTabIndex(value),
          currentIndex: tabController.currentIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting'
            )
          ]
        ),
      ),
    );
  }
}