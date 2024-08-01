
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../controllers/product_controller.dart';
import 'detial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  maxRadius: 28,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/474x/dd/c7/75/ddc77507fff38581324a09a00982e9da.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {},
                    badgeContent: const Text('1'),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.blue,
                      padding: const EdgeInsets.all(6),
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      elevation: 0,
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                Text(
                  'Man\'s Fashion Wears',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        fillColor: const Color.fromARGB(255, 234, 237, 242),
                        filled: true,
                        hintText: 'search',
                        hintStyle:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 148, 45),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.menu_open,
                        size: 30,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.getProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.hasError.toString());
                  } else {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:5, vertical: 5),
                        child: GridView.builder(
                            itemCount: controller.productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              var products = controller.productList[index];
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      style: BorderStyle.solid,
                                      color: const Color.fromARGB(255, 229, 226, 226),
                                      width: 0.7
                                    ),
                                    borderRadius: BorderRadius.circular(14)
                                  ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 2),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              DetailScreen(pro: products));
                                        },
                                        child: Container(
                                          height: 180,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              image: DecorationImage(
                                                  //fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      products.image))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: SizedBox(
                                          height: 50,
                                          width: double.infinity,
                                          child: Text(
                                            products.title,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                overflow: TextOverflow.clip),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3, vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${products.price}\$',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(100),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 1,
                                                        spreadRadius: 1,
                                                        color: Color.fromARGB(
                                                            255, 222, 217, 217),
                                                        offset: Offset(0, 0))
                                                  ]),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          )
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
