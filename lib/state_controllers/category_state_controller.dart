import '../utils/importer.dart';

class CategoryStateController extends GetxController{
  static final CategoryStateController instance = CategoryStateController._();
  CategoryStateController._();


  var categoriesList = <CategoryModel>[].obs; //
  var selectedCategoryId = (-1).obs;
  var isLoading = false.obs;
}