import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  late Map<String, dynamic> _localizedStrings;

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    final loc = AppLocalizations(locale);
    final data = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    loc._localizedStrings = json.decode(data) as Map<String, dynamic>;
    return loc;
  }

  String t(String key, {int? count}) {
    final value = _localizedStrings[key];
    if (value is Map && count != null) {
      if (locale.languageCode == 'ru') {
        final mod10 = count % 10;
        final mod100 = count % 100;
        if (mod10 == 1 && mod100 != 11) return value['one'];
        if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) return value['few'];
        return value['many'];
      }
      return count == 1 ? value['one'] : value['other'].replaceAll('{}', '$count');
    }
    if (value is String) {
      return count != null ? value.replaceAll('{}', '$count') : value;
    }
    return key;
  }
}

class _AppLocDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

extension L10nX on BuildContext {
  AppLocalizations get l10n => Localizations.of<AppLocalizations>(this, AppLocalizations)!;
}
