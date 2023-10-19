

import 'package:flutter/material.dart';
import 'package:untitled1/utills/routes/routes_name.dart';
import 'package:untitled1/view/login_view.dart';
import 'package:untitled1/view/signup_view.dart';
import 'package:untitled1/view/splash_view.dart';
import '../../view/home_screen.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
 final arguments = settings.arguments;
    switch(settings.name){

      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignupView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No Route is Defined'),
            ),
          );
        });

    }
  }
}