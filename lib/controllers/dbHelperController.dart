import 'package:get/get.dart';
import 'package:getx/database/dbhelper.dart';

import '../Models/notesmodel.dart';

class DbHelperController extends GetxController {
  final DbHelper dbHelper = Get.put(DbHelper());
  var notes = <NotesModel>[].obs;
  Future<void> addNotes(NotesModel newnote) async {
    await dbHelper.addNotes(newnote);
    notes.add(newnote);
  }

  Future<void> fetchNotes() async {
    await dbHelper.initDb();
    notes.assignAll(await dbHelper.getNotes());
  }
}
