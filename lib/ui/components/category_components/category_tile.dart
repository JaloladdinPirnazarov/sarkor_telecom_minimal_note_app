import '../../../utils/importer.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryTile({super.key, required this.categoryModel});

  static final CategoryStateController _cStController =
      CategoryStateController.instance;
  static final CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () => categoryRepository.selectCategory(categoryModel.id!),
          child: Container(
            margin: const EdgeInsets.only(right: 6),
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 10),
            decoration:
                _cStController.selectedCategoryId.value == categoryModel.id!
                    ? BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8))
                    : null,
            child: Text(
              categoryModel.categoryName,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _cStController.selectedCategoryId.value ==
                          categoryModel.id!
                      ? Theme.of(context).colorScheme.inversePrimary
                      : Theme.of(context).colorScheme.secondary),
            ),
          ),
        ));
  }
}
