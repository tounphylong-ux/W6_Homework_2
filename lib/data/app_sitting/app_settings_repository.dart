
import 'package:w6/data/app_sitting/app_settings_repository_mock.dart';
import 'package:w6/model/settings/app_settings.dart';

class MockAppSettingsRepository implements AppSettingsRepository {
  AppSettings _settings = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _settings;
  }

  @override
  Future<void> save(AppSettings settings) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _settings = settings;
  }
}
