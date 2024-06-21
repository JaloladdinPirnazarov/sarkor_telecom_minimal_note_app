import 'package:sarkor_telecom_minimal_note_app/utils/importer.dart';

class CategoryRepository {
  static final CategoryStateController _categoryStateController =
      CategoryStateController.instance;
  static final CategoryDataManager _cDataManager = CategoryDataManager();
  static final NoteDataManager _nDataManager = NoteDataManager();
  static final NoteRepository _noteRepository = NoteRepository();
  static final NoteStateController _nnoteStateController =
      NoteStateController.instance;

  Future<void> createCategory(String categoryName) async {
    _categoryStateController.isLoading.value = true;
    await _cDataManager
        .createCategory(CategoryModel(categoryName: categoryName));
    await refreshCategoryList();
  }

  Future<void> refreshCategoryList() async {
    _categoryStateController.isLoading.value = true;

    _categoryStateController.categoriesList.clear();

    final List<CategoryModel> temp = await _cDataManager.readCategories();

    if (temp.isNotEmpty) {
      _categoryStateController.selectedCategoryId.value = -2;

      _categoryStateController.categoriesList
          .add(CategoryModel(categoryName: 'all'.tr, id: -2));
      _categoryStateController.categoriesList.addAll(temp);
      _categoryStateController.categoriesList
          .add(CategoryModel(categoryName: 'uncategorized'.tr, id: -1));
    }

    await _noteRepository.refreshNotes();
    _categoryStateController.isLoading.value = false;
  }

  Future<void> updateCategory(CategoryModel categoryModel) async {
    _categoryStateController.isLoading.value = true;
    await _cDataManager.updateCategory(categoryModel);
    await refreshCategoryList();
  }

  Future<void> deleteCategory(int categoryId) async {
    _categoryStateController.isLoading.value = true;
    await _nDataManager.deleteNoteByCategoryId(categoryId);
    await _cDataManager.deleteCategory(categoryId);
    _categoryStateController.selectedCategoryId.value = -2;
    await refreshCategoryList();
    _categoryStateController.isLoading.value = false;
  }

  void addEditCategory(BuildContext context, CategoryModel? categoryModel) {
    showDialog(
        context: context,
        builder: (context) => AddEditCategoryDialog(catRepository: this));
  }

  Future<void> onUpdateTap(
      BuildContext context, CategoryModel categoryModel) async {
    showDialog(
        context: context,
        builder: (context) => AddEditCategoryDialog(
              catRepository: this,
              categoryModel: categoryModel,
            ));
  }

  Future<void> onDeleteTap(
      BuildContext context, int categoryId, int notesCount) async {
    final String text = notesCount == 0
        ? '${'category'.tr}?'
        : '${'category'.tr} ${'and'.tr} $notesCount ${'note'.tr}${notesCount > 1 ? 's'.tr : ''}';
    showDialog(
        context: context,
        builder: (context) => WarningDialog(
              text: text,
              onDeleteTap: () {
                Navigator.pop(context);
                deleteCategory(categoryId);
              },
            ));
  }

  Future<void> selectCategory(int categoryId) async {
    if (categoryId != _categoryStateController.selectedCategoryId.value) {
      _categoryStateController.selectedCategoryId.value = categoryId;
      await _noteRepository.refreshNotes();
    }
  }

  int countNotesByCategoryId(int categoryId) {
    return categoryId == -2
        ? _nnoteStateController.notesList.length
        : _nnoteStateController.notesList
            .where((note) => note.categoryId == categoryId)
            .length;
  }
}
