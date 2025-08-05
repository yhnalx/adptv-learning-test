import 'package:app/routes/app_pages.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetStartedPage extends BaseView {
  
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          width: double.infinity,
          color: Colors.blue.shade500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/adaptiveLogo.png')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("AdaptiveHub", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),),
                  Text('Welcome to your Adaptive Learning Journey!', style: TextStyle(color: Colors.white),),
                ],
              ),
              Spacer(),
        
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.LOGIN),
                  child: Center(
                    child: Text("Get Started", style: TextStyle(color: Colors.blue.shade500, fontWeight: FontWeight.bold, fontSize: 16),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}