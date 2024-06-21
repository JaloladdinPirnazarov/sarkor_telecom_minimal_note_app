import '../../utils/importer.dart';

class AddEditNotePage extends StatelessWidget {
  final NoteModel? noteModel;

  AddEditNotePage({
    super.key,
    this.noteModel,
  }) {
    if (noteModel != null) {
      _action = 'edit'.tr;
      _titleController.text = noteModel!.title;
      _descriptionController.text = noteModel!.description ?? '';
      _imagePathController.text.value = noteModel!.imagePath ?? '';
    }
  }

  String _action = 'create'.tr;
  final NoteRepository _noteRepository = NoteRepository();
  final CategoryStateController _categoryStateController =
      CategoryStateController.instance;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextStateController _errorController = TextStateController();
  final TextStateController _imagePathController = TextStateController();

  @override
  Widget build(BuildContext context) {
    Future<void> addEditCategory() async {
      final String title = _titleController.text.trim();
      final String description = _descriptionController.text.trim();
      final String imagePath = _imagePathController.text.value;
      if (title.isNotEmpty) {
        Navigator.pop(context);
        if (noteModel != null) {
          noteModel!.title = title;
          noteModel!.description = description.isEmpty ? null : description;
          noteModel!.imagePath = imagePath.isEmpty ? null : imagePath;
          await _noteRepository.updateNote(noteModel!);
        } else {
          final int categoryId = _categoryStateController.selectedCategoryId.value;
          await _noteRepository.createNote(NoteModel(
              categoryId: categoryId == -2 ? -1 : categoryId,
              title: title,
              description: description.isEmpty ? null : description,
              imagePath: imagePath.isEmpty ? null : imagePath,
              createdDate: DateTime.now()));
        }
      } else {
        _errorController.text.value = '';
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '$_action ${'note_lower_case'.tr}',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        actions: [
          noteModel != null
              ? MyIconButton(
                  onTap: () =>
                      _noteRepository.onDeleteTap(context, noteModel!.id!),
                  iconPath: AppIcons.deleteIcon)
              : const SizedBox(),
          MyIconButton(onTap: addEditCategory, iconPath: AppIcons.doneIcon)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Obx(() => TitleTextField(
                hint: 'note_title'.tr,
                controller: _titleController,
                errorText: _errorController.text.value)),
            const SizedBox(
              height: 10,
            ),
            DescriptionTextField(
                controller: _descriptionController, hint: 'note_description'.tr),
            const SizedBox(height: 6,),
            Obx(() => MyImagePicker(
                imagePath: _imagePathController.text.value,
                onTapAdd: () => _noteRepository.imagePickOptions(
                    context, _imagePathController),
                onTapDelete: () => _imagePathController.text.value = ''))
          ],
        ),
      ),
    );
  }
}
