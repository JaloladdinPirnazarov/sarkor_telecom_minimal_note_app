import '../utils/importer.dart';

class ThemeStateController extends GetxController{
  static final ThemeStateController instance = ThemeStateController._();
  ThemeStateController._();


  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;


}