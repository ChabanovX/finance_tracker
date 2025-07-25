import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yndx_homework/features/auth/presentation/pin_code_page.dart';
import 'package:yndx_homework/features/auth/providers.dart';

import 'package:yndx_homework/features/settings/providers.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_app_bar.dart';

part 'settings_widgets.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SettingsTile(title: 'Enable system theme', trailing: _Switcher()),
            const Divider(height: 1),
            _SettingsTile(title: 'App Color', trailing: _ColorPicker()),
            const Divider(height: 1),
            _SettingsTile(title: 'Haptics', trailing: _HapticsSwitcher()),
            const Divider(height: 1),
            _SettingsTile(
              title: 'Password',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const PinCodePage(mode: PinPageMode.setup),
                  ),
                );
              },
            ),
            const Divider(height: 1),
            _SettingsTile(title: 'FaceID/TouchID', trailing: _BiometricSwitcher(),),
            const Divider(height: 1),
            _SettingsTile(title: 'Language', trailing: _LanguagePicker(),),
            const Divider(height: 1),
            _SettingsTile(title: 'About', onPressed: () {}),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
