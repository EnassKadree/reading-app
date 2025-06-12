part of 'data_source.dart';

extension UserSource on DataSource
{
  void saveUser(User user)  
  {
    final userJson = jsonEncode(user.toMap());
    prefs.setString(DataSource._userKey, userJson);
  }

  User? getUser()  
  {
    final userJsonString = prefs.getString(DataSource._userKey); 

    if (userJsonString != null) 
    {
      final Map<String, dynamic> userMap = jsonDecode(userJsonString); 
      return User.fromMap(userMap); 
    }

    return null;
  }

  void clearUser()  
  {
    prefs.remove(DataSource._userKey);
  }
}