import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final CollectionReference Student =
      FirebaseFirestore.instance.collection("Student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 114, 161),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Adding Details",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Student Name")),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Class")),
                          maxLength: 4,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Phone No")),
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Address")),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            addstudent();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 25, 89, 122))),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addstudent() {
    final data = {
      "name": "Ameer",
      "class": "10 A",
      "phone": 8589952006,
      "address": "Moonnamkuttil"
    };
    Student.add(data);
  }
}
