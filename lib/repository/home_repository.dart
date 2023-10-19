

import 'package:untitled1/data/network/NetworkApiService.dart';
import 'package:untitled1/model/movies_model.dart';

import '../data/network/BaseApiServices.dart';
import '../resourses/app_url.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMoviesList()async{

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.MoviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}