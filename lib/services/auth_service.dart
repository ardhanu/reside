import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _usernameKey = 'username';

  final SharedPreferences _prefs;

  AuthService(this._prefs);

  Future<bool> login(String username, String password) async {
    // In a real app, you would validate against a backend
    if (username == 'admin' && password == 'admin123') {
      await _prefs.setBool(_isLoggedInKey, true);
      await _prefs.setString(_usernameKey, username);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _prefs.setBool(_isLoggedInKey, false);
    await _prefs.remove(_usernameKey);
  }

  bool isLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  }

  String? getUsername() {
    return _prefs.getString(_usernameKey);
  }
}
