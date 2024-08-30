import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internsala_assignment/features/home/home.dart';

class SplashScreen extends StatefulWidget {
  static const routePath='/Splash-Screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),
      ()=>context.go(HomeScreen.routePath)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/internshala_og_image.jpg'),),
    );
  }
}