import 'package:fetch_api_project/src/features/authentication/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../products/screens/main_screen.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
  final emailController = TextEditingController(text: 'pengkhun@gmail.com');
  final passwordController = TextEditingController(text: '12345678');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/microsoft.png'),
                  ),
                ),
                const Text(
                  'Login Account',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration( 
                    errorStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
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
                      return "Email fill is required.";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Email is valid.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx((){
                    return TextFormField(
                      cursorColor: Colors.black,
                      obscureText: controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
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
                                  return const Icon(Icons.visibility);
                                }
                                return const Icon(Icons.visibility_off);
                              }
                            )
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontSize: 18)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password fill is required.";
                        }
                        return null;
                      },
                    );
                  } 
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Get.to(()=>MainScreen());
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
                        'Login',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xff3E81CD)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: CircleAvatar(
                          maxRadius: 28,
                          backgroundImage:
                              AssetImage('assets/images/facebook_logo.png'),
                        ),
                      ),
                      Text(
                        'Connect with facebook',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black45)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: CircleAvatar(
                          maxRadius: 28,
                          backgroundImage:
                              AssetImage('assets/images/google_logo.png'),
                        ),
                      ),
                      Text(
                        'Connect with Google',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        'sign up',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
