import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_4/pages/home_page/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final supabase = Supabase.instance.client;
  int imageIndex = 0;
  Timer? timer;
  final List<String> images = [
    'assets/bonbon-buying-and-selling-real-estate.png',
    'assets/transistor-real-estate-insurance-1.png',
    'assets/taxi-real-estate.png',
  ];

  void changeImage() {
    setState(() {
      imageIndex = (imageIndex + 1) % images.length;
    });
  }

  Future<void> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> onSubmit() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    await signUp(email, password);
  }

  Future<void> google() async {
    await supabase.auth.signInWithOAuth(Provider.google);
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      changeImage();
      super.initState();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: double.infinity,
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/delesign-real-estate-market.png',
                    width: 350,
                    height: 350,
                  ),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'Start Managing your finance properties easily',
                    style: TextStyle(color: Color(0xFFa0a4ac), fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: false,
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFeae9ed), width: 2.0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFeae9ed), width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              InkWell(
                onTap: () => signUp(emailController.text.trim(), passwordController.text.trim()),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 120),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 150.0, right: 20),
                    child: Divider(thickness: 1.5),
                  ),
                ),
                Text('or', style: TextStyle(color: Color(0xFFb0b4b8), fontSize: 15.0, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 150),
                    child: Divider(thickness: 1.5),
                  ),
                ),
              ]),
              const SizedBox(height: 40.0),
              InkWell(
                onTap: () async {
                  try {
                    await google();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(color: Color(0xFFe6e7e9), width: 2.5)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network('https://img.icons8.com/color/512/google-logo.png', height: 50),
                      const Text(
                        'Continue with google',
                        style: TextStyle(color: Color(0xFF7e8286), fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            width: MediaQuery.of(context).size.width / 1.75,
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(90.0),
                  child: Text(
                    'Welcome to our real estate management app! Our app is designed to help property owners manage their rental properties and tenants with ease and efficiency.',
                    style: GoogleFonts.aleo(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: Image.asset(
                    images[imageIndex],
                    key: ValueKey<int>(imageIndex),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
