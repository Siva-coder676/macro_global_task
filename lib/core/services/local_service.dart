import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  final SharedPreferences? preferences;
  LocalService(this.preferences);
  static const String PROFILE_INFO = "profileInfo";
  Future saveProfilePicture(profilePic) async {
    return await preferences!.setString(PROFILE_INFO, profilePic);
  }

  Future<String?> getProfilePicture() async {
    return preferences!.getString(PROFILE_INFO);
  }
}
