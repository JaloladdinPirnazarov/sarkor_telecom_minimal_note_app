import '../../../utils/importer.dart';

class CategoryMainList extends StatelessWidget {
  final List<CategoryModel> categoryList;
  final CategoryRepository catRepository;

  const CategoryMainList({
    super.key,
    required this.categoryList,
    required this.catRepository,
  });

  @override
  Widget build(BuildContext context) {
    return categoryList.isEmpty
        ? const EmptyWidget(
            iconPath: AppIcons.folderSickIcon, text: 'No categories')
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final int categoryId = categoryList[index].id!;
              return CategoryMainTile(
                onTap: () {
                  Navigator.pop(context);
                  catRepository.selectCategory(categoryId);
                },
                categoryModel: categoryList[index],
                catRepository: catRepository,
                noteCount: catRepository.countNotesByCategoryId(categoryId),
              );
            },
          );
  }
}
