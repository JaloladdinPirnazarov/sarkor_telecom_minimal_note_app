import '../../utils/importer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key}) {
    _categoryRepository.refreshCategoryList();
  }

  static final CategoryRepository _categoryRepository = CategoryRepository();
  static final NoteStateController _noteStateController =
      NoteStateController.instance;
  static final CategoryStateController _cStController =
      CategoryStateController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MyIconButton(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryPage())),
              iconPath: AppIcons.folderIcon),
          MyIconButton(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage())),
              iconPath: AppIcons.settingsIcon),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'notes_upper_case'.tr,
              style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 16,
            ),
            SearchField(),
            const SizedBox(
              height: 10,
            ),
            CategoryList(categoryList: _cStController.categoriesList),
            const SizedBox(
              height: 6,
            ),
            Obx(() => NoteList(noteList: _noteStateController.notesList.value))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddEditNotePage())),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
