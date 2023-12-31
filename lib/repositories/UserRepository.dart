import 'package:first_test/Database/db_helper.dart';
import 'package:first_test/models/UserModel.dart';

class user_repository
{
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


  Future<int> delete(int id)async
  {
    try
    {
      var result = await DbHelper().delete_user(DBTables.Users, id);
      return result;
    }
    catch(e)
    {
      return 0;
    }
  }

  Future<int> update(Map<String, dynamic> obj, int id)async
  {
    try
    {
      // await Future.delayed(Duration(seconds: 2));
      var result = await DbHelper().update_user(DBTables.Users, obj);
      return result;
    }
    catch(e)
    {
      return 0;
    }
  }


  Future<List<UserModel>> getAllUsers()async
  {
    try
    {
      var result = await DbHelper().get_users(DBTables.Users);
      List<UserModel> list = [];
      if(result != null)
        {
          for(var item in result)
            {
              list.add(UserModel.fromJson(item));
            }
        }
      return list;
    }
    catch(e)
    {
      rethrow;
    }
  }
}