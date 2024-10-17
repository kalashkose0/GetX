import 'package:get/get.dart';
import 'package:getx/database/dbhelper.dart';
import 'package:getx/models/notesmodel.dart';
import 'package:getx/controllers/counterController.dart';

class DbHelperController extends GetxController {
  final DbHelper dbHelper = Get.put(DbHelper());
  var notes = <NotesModel>[].obs;
  Future<void> addNotes(NotesModel newnote) async {
    await dbHelper.addNotes(newnote);
    notes.add(newnote);
  }

  Future<void> fetchNotes() async {
    await dbHelper.getNotes();
    notes.assignAll(await dbHelper.getNotes());
  }
}
