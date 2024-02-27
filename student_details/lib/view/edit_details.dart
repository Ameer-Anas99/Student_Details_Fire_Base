// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/controller/student_provider.dart';
import 'package:student_details/model/student_model.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  StudentModel student;
  String id;
  EditScreen({super.key, required this.id, required this.student});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController rollnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController divisioncontroller = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.student.name ?? '';
    divisioncontroller.text = widget.student.division ?? '';
    rollnoController.text = widget.student.rollno ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                child: IconButton(
                    onPressed: () {
                      _showImageOptions(context);
                    },
                    icon: const Icon(Icons.camera)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: divisioncontroller,
                  decoration: InputDecoration(
                      hintText: "class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: rollnoController,
                  decoration: InputDecoration(
                      hintText: "rollno",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    editStudent(context);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }

  void editStudent(BuildContext context) async {
    final pro = Provider.of<StudentProvider>(context, listen: false);

    try {
      final editedname = nameController.text;
      final editedrollno = rollnoController.text;
      final editedage = divisioncontroller.text;
      final editedimage = imageController.text;

      // Update image URL in Firestore

      final updatedstudent = StudentModel(
        name: editedname,
        rollno: editedrollno,
        division: editedage,
        image: editedimage,
      );

      // Update student information in Firestore
      pro.updateStudent(widget.id, updatedstudent);

      Navigator.pop(context);
    } catch (e) {
      // Handle exceptions appropriately
      print("Error updating student: $e");
    }
  }

  Future<void> _showImageOptions(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an option"),
          actions: [
            TextButton(
              onPressed: () async {},
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () async {},
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }
}
