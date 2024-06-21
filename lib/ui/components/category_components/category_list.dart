import '../../../utils/importer.dart';

class CategoryList extends StatelessWidget {
  final RxList<CategoryModel> categoryList;

  const CategoryList({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Obx(() => ListView.builder(
        itemCount: categoryList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryTile(categoryModel: categoryList[index]);
        },
      )),
    );
  }
}