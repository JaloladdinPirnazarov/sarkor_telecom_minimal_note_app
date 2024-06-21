import '../../../utils/importer.dart';

class CategoryMainTile extends StatelessWidget {
  final Function() onTap;
  final CategoryModel categoryModel;
  final CategoryRepository catRepository;
  final int noteCount;

  CategoryMainTile({
    super.key,
    required this.categoryModel,
    required this.catRepository,
    required this.onTap,
    required this.noteCount,
  });

  final CategoryStateController _categoryStateController =
      CategoryStateController.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.only(left: 14, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            _categoryStateController.selectedCategoryId.value ==
                    categoryModel.id!
                ? SvgPicture.asset(
                    AppIcons.doneIcon,
                    width: 24,
                  )
                : const SizedBox(
                    width: 24,
                  ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                categoryModel.categoryName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        _categoryStateController.selectedCategoryId.value ==
                                categoryModel.id!
                            ? FontWeight.w600
                            : FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text('$noteCount',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary)),
            ),
            categoryModel.id == -1 || categoryModel.id == -2
                ? const SizedBox(
                    height: 48,
                    width: 48,
                  )
                : Builder(
                    builder: (context) => IconButton(
                        onPressed: () => showPopover(
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            width: 100,
                            height: 100,
                            context: context,
                            bodyBuilder: (context) => EditDeleteOptions(
                                  onEditTap: () => catRepository.onUpdateTap(
                                      context, categoryModel),
                                  onDeleteTap: () => catRepository.onDeleteTap(
                                      context, categoryModel.id!, noteCount),
                                )),
                        icon: const Icon(Icons.more_vert)),
                  )
          ],
        ),
      ),
    );
  }
}
