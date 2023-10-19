



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled1/utills/routes/routes_name.dart';
import 'package:untitled1/view_model/user_view_model.dart';
import '../../model/user_model.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{

    getUserData().then((value)async{
      print(value.token.toString());
      if(value.token.toString() == 'null' || value.token.toString() == ''){
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}