import 'package:shared_preferences/shared_preferences.dart';

class AppCache{
  static const keyOnBoarding = 'onboarding';

  final _preferences = SharedPreferences.getInstance();

  Future<void> completeOnBoarding() async{
    final preferences = await _preferences;
    preferences.setBool(keyOnBoarding, true);
  }

  Future<void> notCompleteOnBoarding() async{
    final preferences = await _preferences;
    preferences.setBool(keyOnBoarding, false);
  }

  Future<bool> didOnBoardingCompleted() async{
    final preferences = await _preferences;
    return preferences.getBool(keyOnBoarding) ?? false;
  }
}