import '../../../utils/importer.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      controller: _searchController,
      onChanged: (value) {
        NoteRepository().searchNotes(value);
      },
      decoration: InputDecoration(
        hintText: 'search_notes'.tr,
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
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
