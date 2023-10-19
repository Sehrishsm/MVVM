

import 'package:untitled1/data/network/BaseApiServices.dart';
import 'package:untitled1/data/network/NetworkApiService.dart';
import 'package:untitled1/resourses/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{

   try{

     dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
     return response;
   }catch(e){
   throw e;
   }
  }

  Future<dynamic> signupApi(dynamic data)async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}