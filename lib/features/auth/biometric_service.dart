import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiometricService {
  static const _key = 'biometric_enabled';

  static Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<bool> authenticate() async {
    final localAuth = LocalAuthentication();
    final canCheck = await localAuth.canCheckBiometrics ||
        await localAuth.isDeviceSupported();
    if (!canCheck) return false;
    return localAuth.authenticate(
      localizedReason: 'Для доступа к приложению',
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }
}
