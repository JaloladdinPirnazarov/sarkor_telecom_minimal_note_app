import '../../../utils/importer.dart';

class NoteList extends StatelessWidget {
  final List<NoteModel> noteList;

  const NoteList({super.key, required this.noteList});

  @override
  Widget build(BuildContext context) {
    return noteList.isNotEmpty
        ? Expanded(
            child: ListView.builder(
                itemCount: noteList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    NoteTile(noteModel: noteList[index])))
        : EmptyWidget(iconPath: AppIcons.noteIcon, text: 'no_notes'.tr);
  }
}
