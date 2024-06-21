import '../../../utils/importer.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;
  const NoteTile({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEditNotePage(noteModel: noteModel,)));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric( vertical: 6),
        padding: const EdgeInsets.only(left: 14, top: 12, bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Text(
              textShorter(noteModel.title, 20),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 6,),
            noteModel.description != null
                ? Text(
                    textShorter(noteModel.description!, 38),
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary),
                  )
                : const SizedBox(),
            const SizedBox(height: 6,),
            Text(
              formatDateTime(noteModel.createdDate),
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}
