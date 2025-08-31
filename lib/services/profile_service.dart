import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';



class ProfileService{

  Dio dio;

  ProfileService(this.dio);



  Future<String> changeUserPassword({required String oldPassword ,
  required String newPassword,
  required String newPasswordConfirmation
  })async{
   String url = ApiConstants.baseUrl + ApiConstants.changePassword;
   try{

   Response response = await dio.post(url,data: {
     'current_password':oldPassword,
     'new_password':newPassword,
     'new_password_confirmation':newPasswordConfirmation
   },  options: Options(
       headers: {
         'Accept': 'application/json',
         'Authorization': dio.options.headers['Authorization'],
         'Content-Type': 'application/json',
       }
   ));

   return response.data['message'];
   }catch(error){
     rethrow;
   }
  }


  Future<Map<String,dynamic>> getUserProfile()async{

    String url = ApiConstants.baseUrl + ApiConstants.getUserProfile;

    try{
    Response response = await dio.get(url);

    Map<String,dynamic> map = response.data['data'];
    return map;
    }catch(error){
     rethrow;
    }
  }


  Future<String> updateUserProfile({
    required String? newName,
    required String? newPhone
})async{

  String url = ApiConstants.baseUrl + ApiConstants.updateProfile;

  try{

  Response response = await dio.post(url,data: {
   'name':newName,
    'customer':{
     'phone_number':newPhone
    }
  });

   if(response.statusCode == 200){
     return response.data['message'];
   }
  return 'Something Went Wrong';
  }catch(error){
    rethrow;
  }

  }









}