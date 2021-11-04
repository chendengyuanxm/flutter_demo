import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:flutter_demo/provider/localization_provider.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_widget/lib_widget.dart';
import 'package:provider/provider.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({Key? key}) : super(key: key);

  @override
  _LanguageSettingPageState createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
  }

  _getCurrentLocal() {
    _locale = Localizations.maybeLocaleOf(context);
    setState(() {
    });
  }

  _onLanguageChanged(value) {
    _locale = value;
    Provider.of<LocalizationProvider>(context, listen: false).changeCurrentLocale(_locale!);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocal();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(S.current.languageSetting,),
      ),
      body: Container(
        child: Column(
          children: S.delegate.supportedLocales.map(
            (e) => RadioListTile(
              value: e,
              groupValue: _locale,
              onChanged: (value) => _onLanguageChanged(value),
              title: Text(e.toString(),),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
