import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yndx_homework/core/network/backup_manager.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefs (Ref ref) async {
  return await SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
BackupManager backupManager(Ref ref) {
  return BackupManager();
}
