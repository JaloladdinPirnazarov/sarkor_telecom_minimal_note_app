import '../../../utils/importer.dart';

class DescriptionTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const DescriptionTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: TextField(
              maxLines: null,
              expands: true,
              controller: controller,
              style: const TextStyle(fontSize: 18),
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
