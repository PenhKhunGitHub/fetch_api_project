import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 247, 239, 239),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(14)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 35,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/474x/dd/c7/75/ddc77507fff38581324a09a00982e9da.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Karina',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                'Apple ID,iCloud,Media & Purchases',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Color.fromARGB(255, 202, 200, 200),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(14)),
                child: Column(
                  children: [
                    //===== Language ====
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.language_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text('English'),
                      title: const Text(
                        'Language',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color.fromARGB(255, 202, 200, 200),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Color.fromARGB(255, 235, 233, 233),
                    ),
                    // Environment
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 194, 33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.computer_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text('Development'),
                      title: const Text(
                        'Environment',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color.fromARGB(255, 202, 200, 200),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Color.fromARGB(255, 235, 233, 233),
                    ),
                    //Dark mode
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 194, 33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Obx(
                         (){
                            if(themeController.isDark.value){
                              return const Icon(
                                Icons.nightlight,
                                size: 30,
                                color: Colors.white,
                              );
                            }
                            return const Icon(
                            Icons.wb_sunny,
                            size: 30,
                            color: Colors.white,
                          );
                         }
                        ),
                      ),
                      subtitle: Obx((){
                          if(themeController.isDark.value){
                            return Text('on');
                          }
                          return Text('off');
                        }
                      ),
                      title: Obx(
                        (){
                          if(themeController.isDark.value){
                            return const Text(
                              'Dark Mode',
                              style: TextStyle(fontSize: 18),
                            );
                          }
                          return const Text(
                            'Light Mode',
                            style: TextStyle(fontSize: 18),
                          );
                        }
                      ),
                      trailing:  Obx((){
                          return CupertinoSwitch(
                            activeColor: Colors.blueAccent,
                            value: themeController.isDark.value, 
                            onChanged: (bool val){
                              themeController.changeTheme(val);
                            }
                          );
                        }, 
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
