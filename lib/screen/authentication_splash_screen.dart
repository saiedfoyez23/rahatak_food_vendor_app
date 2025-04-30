import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/widget.dart';

class AuthenticationSplashScreen extends StatelessWidget {
  AuthenticationSplashScreen({super.key});

  AuthenticationSplashScreenWidget authenticationSplashScreenWidget = Get.put(AuthenticationSplashScreenWidget());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authenticationSplashScreenWidget.authenticationSplashScreenWidget(context: context),
    );
  }
}
