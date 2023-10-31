import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prince/Screens/Webpage.dart';
class Splashscreen  extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
          () =>
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => webpage())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.5,
                child: Image.network("https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=434,fit=crop,q=95/Y4LODR9ED1S2NLX4/aamani_group_logo-removebg-preview-Aq2e3QQxG6HRznjg.png",height: 50, width: 50,),
              ),
              SizedBox(height: 80,),
              const Center(child: Text("V 2.1",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
              SizedBox(height: 5,),
              const Center(child: Text("@ WaveTech",style: TextStyle(fontSize: 10,),),),
            ],
          ),
        ),
      ),
    );
  }
}
