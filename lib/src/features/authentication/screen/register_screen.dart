
import 'package:fetch_api_project/src/features/authentication/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  final controller = Get.put(RegisterController());
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            color: const Color(0xffC7CACD),
                            borderRadius: BorderRadius.circular(14)),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<RegisterController>(
                  builder: (_) {
                    if (controller.profileImage == null) {
                      return Stack(children: [
                        const CircleAvatar(
                          maxRadius: 50,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            child: IconButton(
                                onPressed: () {
                                  controller.pickImage();
                                },
                                icon: const Icon(Icons.camera_alt)),
                          ),
                        )
                      ]);
                    }
                    return Stack(children: [
                      CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: FileImage(controller.profileImage!),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                controller.pickImage();
                              },
                              icon: const Icon(Icons.camera_alt)),
                        ),
                      )
                    ]);
                  },
                ),
                const Text(
                  'Register Account',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: usernameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 28,
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(fontSize: 18)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username is not required.";
                    }
          
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.email,
                        size: 28,
                      ),
                      hintText: 'E-mail',
                      hintStyle: const TextStyle(fontSize: 18)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is not required.";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Email is not valid.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  ()=>TextFormField(
                    controller: passwordController,
                    obscureText: controller.isPasswordVisible.value,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 28,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => controller.visiblePassword(),
                          child: Obx((){
                              if(controller.isPasswordVisible.value){
                                return Icon(Icons.visibility_off);
                              }
                              return Icon(Icons.visibility);
                            } 
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontSize: 18)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is not required.";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => TextFormField(
                    controller: comfirmPasswordController,
                    obscureText: controller.isPasswordVisible.value,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 28,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () => controller.visiblePassword(),
                            child: Obx((){
                                if(controller.isPasswordVisible.value){
                                  return Icon(Icons.visibility_off);
                                }
                                return Icon(Icons.visibility);
                              } 
                            ),
                          ),
                        hintText: 'Comfirm Password',
                        hintStyle: const TextStyle(fontSize: 18)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Comfirm Password is not required.";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffE3A153)),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
                  ),
                ),
          )),
    );
  }
}
