import '../utils/importer.dart';

class SettingsRepository {
  static final SettingsRepository instance = SettingsRepository._();
  SettingsRepository._();

  final ThemeStateController _themeStateController =
      ThemeStateController.instance;

  late  SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = await _getThemeMode();
    await switchTheme(isDarkMode);
  }

  bool isDarkMode_() {
    return _themeStateController.currentTheme.value == ThemeMode.dark;
  }

  Future<void> _saveThemeMode(bool isDarkMode) async {
   await _prefs.setBool('is_dark_mode', isDarkMode);
  }

  Future<bool> _getThemeMode() async {
    return await _prefs.getBool('is_dark_mode')??false;
  }

  Future<void> switchTheme(bool? isDarkMode) async {
    if (isDarkMode != null) {
      if (isDarkMode) {
        _themeStateController.currentTheme.value = ThemeMode.dark;
      } else {
        _themeStateController.currentTheme.value = ThemeMode.light;
      }
    } else {
      final bool isDarkMode = isDarkMode_();
      if (isDarkMode) {
        _themeStateController.currentTheme.value = ThemeMode.light;
      } else {
        _themeStateController.currentTheme.value = ThemeMode.dark;
      }
      await _saveThemeMode(!isDarkMode);
    }
  }
}
