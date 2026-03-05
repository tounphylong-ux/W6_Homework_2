import 'package:flutter/widgets.dart';
import 'package:w6/data/app_sitting/app_settings_repository_mock.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository repository;
  AppSettings? _appSettings;

  AppSettingsState({required this.repository});

  Future<void> init() async {
    // Might be used to load data from repository\
    _appSettings = await repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await repository.save(_appSettings!);
    notifyListeners();
  }
}
