import 'package:fetch_api_project/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}
final controller = Get.put(LanguageController());
class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                controller.changuageLanguage();
              } ,
              child: SizedBox(
                height: 82,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language'.tr,
                      style: const TextStyle(fontSize: 16),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'English'.tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    const Divider(
                      //height: 5,
                      color: Colors.grey,
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}