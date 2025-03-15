import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_sphere/core/models/user.dart';

class UserRepository {
  static Future<void> saveUserDetails(User userDetails) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", userDetails.username);
    await prefs.setInt("userId", userDetails.userId);
  }

  static Future<User> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return User.fromJson({
      "userName": prefs.getString("username"),
      "userId": prefs.getInt("userId"),
    });
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    await prefs.remove("userId");
  }
}
