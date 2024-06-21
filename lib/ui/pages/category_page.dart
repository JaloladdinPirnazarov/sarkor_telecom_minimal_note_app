import '../../utils/importer.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static final CategoryRepository _categoryRepository = CategoryRepository();
  static final CategoryStateController _cStController =
      CategoryStateController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'categories'.tr,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: Obx(() => CategoryMainList(
          catRepository: _categoryRepository,
          categoryList: _cStController.categoriesList.value)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _categoryRepository.addEditCategory(context, null),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
