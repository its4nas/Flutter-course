import 'package:dio/dio.dart';
import 'package:first_test/Database/db_helper.dart';
import 'package:first_test/models/UserModel.dart';

class user_repository
{

  late Dio dio;
  user_repository() {
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<UserModel>> getAllUsers()async
  {
    try
    {
      var result = await dio.get('http://localhost:8080/flutter/index.php');
      List<UserModel> list = [];
      if (result.statusCode == 200) {
        var data = result.data as List;
        if(data.isNotEmpty)
        {
          for(var item in data)
          {
            list.add(UserModel.fromJson(item));
          }
        }
      }
      return list;
    }
    catch(e)
    {
      rethrow;
    }
  }

  Future<int> add_user(Map<String, dynamic> obj)async
  {
    try
    {
      await Future.delayed(Duration(seconds: 2));
      var result = await DbHelper().add_user(DBTables.Users, obj);
      return result;
    }
    catch(e)
    {
      return 0;
    }
  }
}