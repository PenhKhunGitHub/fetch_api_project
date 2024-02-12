
import 'package:fetch_api_project/controllers/shop_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopCardScreen extends StatefulWidget {
  const ShopCardScreen({super.key});

  @override
  State<ShopCardScreen> createState() => _ShopCardScreenState();
}

class _ShopCardScreenState extends State<ShopCardScreen> {
  final cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Card"),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 0.2,
                    blurRadius: 3,
                    color: Color.fromARGB(255, 219, 216, 216),
                    offset: Offset(1, 1)
                  )
                ],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(7),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/karina.jpeg"),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Karina',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 7,),
                          const Text(
                            'karina',
                            style: TextStyle(fontSize: 16,color: Colors.grey),
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cardController.decrement();
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 232, 230, 230),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                        spreadRadius: 0.1,
                                        blurRadius: 0.3,
                                        color: Color.fromARGB(255, 99, 96, 96),
                                        offset: Offset(0.5, 0.5)
                                      )
                                    ],
                                  ),
                                  child: const Icon(Icons.remove,color: Colors.black,),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              Obx(()=> Text(
                                  cardController.count.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              GestureDetector(
                                onTap: () {
                                  cardController.increment();
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 232, 230, 230),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                        spreadRadius: 0.1,
                                        blurRadius: 0.3,
                                        color: Color.fromARGB(255, 99, 96, 96),
                                        offset: Offset(0.5, 0.5)
                                      )
                                    ],
                                  ),
                                  child: const Icon(Icons.add,color: Colors.black,),
                                ),
                              ),
                              const SizedBox(width: 130,),
                              const Text(
                                '\$12200',
                                style: TextStyle(
                                  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}