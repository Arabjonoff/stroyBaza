import 'package:flutter/material.dart';
import 'package:stroy_baza/src/ui/login/login_screen.dart';
import 'package:stroy_baza/src/ui/main_screen.dart';
import 'package:stroy_baza/src/utils/cache.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if(CacheService.getUserToken().isEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return LoginScreen();
        }));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return MainScreen();
        }));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
