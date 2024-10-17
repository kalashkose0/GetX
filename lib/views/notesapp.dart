import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/dbHelperController.dart';
import 'package:getx/views/addDataScreen.dart';

class NotesApp extends StatelessWidget {
  final DbHelperController dbHelperController = Get.put(DbHelperController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        var data = dbHelperController.notes[index];
        return ListTile(
          leading: Text("${index + 1}"),
          title: Text(data.title),
          subtitle: Text(data.desc),
        );
      },
      itemCount: dbHelperController.notes.length  ,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddDataScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
