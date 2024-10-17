import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/dbHelperController.dart';
import 'package:getx/views/widgets/uihelper.dart';
import 'dart:developer';
import '../Models/notesmodel.dart';

class AddDataScreen extends StatelessWidget {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  final DbHelperController dbHelperController = Get.put(DbHelperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              controller: titlecontroller,
              text: "Enter title",
              iconData: Icons.title),
          UiHelper.CustomTextField(
              controller: desccontroller,
              text: "Enter desc",
              iconData: Icons.description),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                addData(titlecontroller.text.toString(),
                    desccontroller.text.toString(), context);
              },
              child: Text("Add Data"))
        ],
      ),
    );
  }

  addData(String title, String desc, BuildContext context) {
    if (title == "" || desc == "") {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter Required Field's")));
    } else {
      final newnote = NotesModel(title: title, desc: desc);
      dbHelperController.addNotes(newnote);
      // Get.back();
      log("Data Inserted");
    }
  }
}
