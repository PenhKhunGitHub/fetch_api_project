import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Product',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
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
                borderSide: const BorderSide(color: Colors.black, width: 1),
                elevation: 0,
              ),
              child: const Icon(
                Icons.shopping_cart,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: productController.getProduct(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Text('Error : ${snapshot.hasError}');
            }else{
              return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: ((context, index) {
                var products = productController.productList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    //style: BorderStyle.none
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        products.image
                                      ))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products.category.name,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        '\$ ${products.price}',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 23,
                                    width: 23,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(100),
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3,),
                      const Divider(
                        indent: 75,
                        thickness: 1,
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              })),
        );
            }
          },
      )
    );
  }
}
