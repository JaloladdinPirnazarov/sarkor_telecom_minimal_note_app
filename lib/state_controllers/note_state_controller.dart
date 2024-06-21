import '../utils/importer.dart';

class NoteStateController extends GetxController{
  static final NoteStateController instance = NoteStateController._();
  NoteStateController._();


  bool initial = true;
  List<NoteModel> currentList = [];
  var notesList = <NoteModel>[].obs;
  var isLoading = false.obs;
}