import '../../../utils/importer.dart';

class AddEditCategoryDialog extends StatelessWidget {
  final CategoryModel? categoryModel;
  final CategoryRepository catRepository;

  AddEditCategoryDialog(
      {super.key, this.categoryModel, required this.catRepository}) {
    if (categoryModel != null) {
      action = 'Edit';
      _textController.text = categoryModel!.categoryName;
    }
  }

  String action = 'Create';
  final TextEditingController _textController = TextEditingController();
  final TextStateController _errorController = TextStateController();

  @override
  Widget build(BuildContext context) {
    void dismissDialog() {
      _errorController.text.value = '';
      Navigator.of(context).pop();
      _textController.clear();
    }

    void addEditCategory() {
      if (_textController.text.trim().isNotEmpty) {
        String categoryName = _textController.text;
        if (categoryModel != null) {
          categoryModel!.categoryName = categoryName;
          catRepository.updateCategory(categoryModel!);
        } else {
          catRepository.createCategory(categoryName);
        }
        dismissDialog();
      } else {
        _errorController.text.value = 'Fill the field';
      }
    }

    return AlertDialog(
      title: Text('$action category'),
      content: Obx(() => TextField(
            controller: _textController,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            decoration: InputDecoration(
              hintText: 'Category name',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary), // Color when the TextField is not focused
              ),
              prefixIcon: const Icon(Icons.search),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary), // Color when the TextField is focused
              ),
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
              errorText: _errorController.text.value == ''
                  ? null
                  : _errorController.text.value,
            ),
          )),
      actions: [
        MaterialButton(
          onPressed: dismissDialog,
          child: const Text('Cancel'),
        ),
        MaterialButton(
          onPressed: addEditCategory,
          child: Text(action),
        ),
      ],
    );
  }
}
