import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


import 'package:yndx_homework/features/settings/providers.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_app_bar.dart';

part 'settings_widgets.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Настройки'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SettingsTile(title: 'Системная тема', trailing: _Switcher()),
            const Divider(height: 1,),
            _SettingsTile(title: 'Основной цвет', trailing: _ColorPicker()),
            const Divider(height: 1, ),
            _SettingsTile(title: 'Хаптики',trailing: _HapticsSwitcher(),),
            const Divider(height: 1,),
            _SettingsTile(title: 'Код пароль', onPressed: () {}),
            const Divider(height: 1,),
            _SettingsTile(title: 'FaceID/TouchID', onPressed: () {}),
            const Divider(height: 1,),
            _SettingsTile(title: 'Язык', onPressed: () {}),
            const Divider(height: 1,),
            _SettingsTile(title: 'О программе', onPressed: () {}),
            const Divider(height: 1,),
          ],
        ),
      ),
    );
  }
}
