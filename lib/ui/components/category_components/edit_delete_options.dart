import '../../../utils/importer.dart';

class EditDeleteOptions extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  const EditDeleteOptions({
    super.key,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // edit option
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
            onEditTap!();
          },
          child: SizedBox(
            height: 50,
            child: Center(
                child: Text(
                  'Edit',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),
          ),
        ),

        // delete option
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
            onDeleteTap!();
          },
          child: SizedBox(
            height: 50,
            child: Center(
                child: Text(
                  'Delete',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),
          ),
        ),
      ],
    );
  }
}
