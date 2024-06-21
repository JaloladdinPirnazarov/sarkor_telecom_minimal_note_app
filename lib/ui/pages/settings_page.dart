import 'package:flutter/cupertino.dart';
import '../../utils/importer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static final ThemeStateController _themeStateController =
      ThemeStateController.instance;

  static final SettingsRepository _settingsRepository = SettingsRepository.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'settings'.tr,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'app_theme'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    _themeStateController.currentTheme.value == ThemeMode.dark
                        ? 'dark_mode'.tr
                        : 'light_mode'.tr,
                  ),
                ),
                Obx(
                  () => CupertinoSwitch(
                    value: _themeStateController.currentTheme.value ==
                        ThemeMode.dark,
                    onChanged: (value) {
                      _settingsRepository.switchTheme(null);
                      Get.changeThemeMode(
                          _themeStateController.currentTheme.value);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
