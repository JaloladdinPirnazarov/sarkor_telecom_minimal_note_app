import 'importer.dart';

final CategoryModel fCategoryModel1 =
    CategoryModel(categoryName: 'All', id: -1);
final CategoryModel fCategoryModel2 =
    CategoryModel(categoryName: 'General', id: -2);
final CategoryModel fCategoryModel3 =
    CategoryModel(categoryName: 'Work', id: -3);

final NoteModel fNoteModel1 = NoteModel(
    categoryId: -1,
    title: 'Its a test title',
    description: 'Its just a simple description to test the note tile',
    createdDate: DateTime.now());
