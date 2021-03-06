import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:lib_core/lib_core.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale? _currentLocale;
  Locale? get locale => _currentLocale;
  List<Locale> get supportLocale => S.delegate.supportedLocales;

  LocalizationProvider(BuildContext context) {
    _currentLocale = Localizations.maybeLocaleOf(context);
    LogUtil.v('current locate: $_currentLocale');
  }

  changeCurrentLocale(Locale locale) {
    LogUtil.v('change locate: $locale');
    _currentLocale = locale;
    S.delegate.load(_currentLocale!);
    notifyListeners();
  }
}