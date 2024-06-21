import '../utils/importer.dart';

class NoteRepository {
  final NoteDataManager _nDataManager = NoteDataManager();
  final CategoryStateController _categoryGetController =
      CategoryStateController.instance;
  final NoteStateController _noteGetController = NoteStateController.instance;

  Future<void> createNote(NoteModel noteModel) async {
    _noteGetController.isLoading.value = true;
    await _nDataManager.createNote(noteModel);
    await refreshNotes();
    _noteGetController.isLoading.value = false;
  }

  Future<void> refreshNotes() async {
    _noteGetController.isLoading.value = true;
    _noteGetController.notesList.clear();
    _noteGetController.currentList.clear();
    _noteGetController.currentList.addAll(
        _categoryGetController.selectedCategoryId.value == -2
            ? await _nDataManager.readAllNotes()
            : await _nDataManager.readNotesByCategoryId(
                _categoryGetController.selectedCategoryId.value));
    _noteGetController.notesList.addAll(_noteGetController.currentList);
    _noteGetController.isLoading.value = false;
  }

  Future<void> updateNote(NoteModel noteModel) async {
    _noteGetController.isLoading.value = true;
    await _nDataManager.updateNote(noteModel);
    await refreshNotes();
  }

  Future<void> delete(int noteId) async {
    _noteGetController.isLoading.value = true;
    await _nDataManager.deleteNote(noteId);
    await refreshNotes();
  }

  Future<void> onDeleteTap(BuildContext context, int noteId) async {
    showDialog(
        context: context,
        builder: (context) => WarningDialog(
            onDeleteTap: () {
              Navigator.pop(context);
              delete(noteId);
            },
            text: 'note?'));
  }

  Future<void> imagePickOptions(
      BuildContext context, TextStateController imagePathController) async {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ImagePickOptions(
              onTapCamera: () =>
                  pickImage(ImageSource.camera, imagePathController),
              onTapGallery: () =>
                  pickImage(ImageSource.gallery, imagePathController));
        });
  }

  Future<void> pickImage(
      ImageSource source, TextStateController imagePathController) async {
    final returnedImage = await ImagePicker().pickImage(source: source);
    if (returnedImage != null) {
      imagePathController.text.value = returnedImage.path;
    }
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      _noteGetController.notesList.assignAll(_noteGetController.currentList);
    } else {
      String lowerCaseQuery = query.toLowerCase();

      var filteredNotes = _noteGetController.notesList.where((note) {
        String lowerCaseTitle = note.title.toLowerCase();
        String? lowerCaseDescription = note.description?.toLowerCase();

        return lowerCaseTitle.contains(lowerCaseQuery) ||
            (lowerCaseDescription?.contains(lowerCaseQuery) ?? false);
      }).toList();

      _noteGetController.notesList.assignAll(filteredNotes);
    }
  }
}
