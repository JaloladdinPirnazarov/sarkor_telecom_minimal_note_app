import '../../../utils/importer.dart';

class TitleTextField extends StatelessWidget {
  final String hint;
  final String errorText;
  final TextEditingController controller;

  const TitleTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .secondary), // Color when the TextField is not focused
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .inversePrimary), // Color when the TextField is focused
        ),
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        hintText: 'Note title',
        errorText: errorText == '' ? null : errorText,
      ),
    );
  }
}
