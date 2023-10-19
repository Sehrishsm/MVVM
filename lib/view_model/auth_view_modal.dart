

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/repository/auth_repository.dart';
import 'package:untitled1/utills/routes/routes_name.dart';
import 'package:untitled1/utills/utills.dart';
import 'package:untitled1/view_model/user_view_model.dart';

import '../model/user_model.dart';

class AuthViewModal with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading =false;
  bool get signupLoading => _signupLoading;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setsignupLoading(bool value){
    _signupLoading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data, BuildContext context)async{

    setLoading(true);
_myRepo.loginApi(data).then((value) {
  setLoading(false);
 final userPreference = Provider.of<UserViewModel>(context, listen: false);
 userPreference.saveUser(
UserModel(
  token: value['token'].toString()
)

 );

  Utils.flushBarErrorMessage('login successfully', context);

  Navigator.pushNamed(context, RoutesName.home);
  if(kDebugMode){
    print(value.toString());
  }
}).onError((error, stackTrace) {
  setLoading(false);
  if(kDebugMode){
    // Utils.flushBarErrorMessage(error.toString(), context);
    print(error.toString());
  }
});
  }

  Future<void> signupApi(dynamic data, BuildContext context)async{

    setsignupLoading(true);
    _myRepo.signupApi(data).then((value) {
      setsignupLoading(false);
      Utils.flushBarErrorMessage('signup successfully', context);

      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setsignupLoading(false);
      if(kDebugMode){
        // Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}