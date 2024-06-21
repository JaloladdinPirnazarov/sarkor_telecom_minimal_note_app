import 'utils/importer.dart';

final SettingsRepository _settingsRepository = SettingsRepository.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _settingsRepository.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      theme: _settingsRepository.isDarkMode_()
          ? CustomTheme.darkTheme
          : CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      translations: Messages(),
      locale: const Locale('en','EN'),
      fallbackLocale: const Locale('en','EN'),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
    );
  }
}
