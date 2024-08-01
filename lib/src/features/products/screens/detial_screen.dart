

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.pro});
  ProductModel pro;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Detail Product',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image(
                //fit: BoxFit.cover,
                image: NetworkImage(
                  widget.pro.image
                )
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.pro.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '\$ ${widget.pro.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Text(
                widget.pro.description,
                style: const TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.clip
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 67, 161, 237)
          ),
          child: const Center(
            child: Text(
              'Add To Card',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}