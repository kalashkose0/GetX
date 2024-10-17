import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/counterController.dart';

class counterApp extends StatelessWidget {
  final CounterController counter = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Text(
            counter.count.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
