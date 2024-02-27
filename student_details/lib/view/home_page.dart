// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/controller/student_provider.dart';
import 'package:student_details/view/delete.dart';
import 'package:student_details/view/details.dart';
import 'package:student_details/model/student_model.dart';
import 'package:student_details/view/add_details.dart';
import 'package:student_details/view/edit_details.dart';

class HomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Consumer<StudentProvider>(
            builder: (context, value, child) => Column(
              children: [
                StreamBuilder<QuerySnapshot<StudentModel>>(
                  stream: value.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Snapshot has error'),
                      );
                    } else {
                      List<QueryDocumentSnapshot<StudentModel>> studentsDoc =
                          snapshot.data?.docs ?? [];
                      return Expanded(
                        child: ListView.builder(
                          itemCount: studentsDoc.length,
                          itemBuilder: (context, index) {
                            final data = studentsDoc[index].data();
                            final id = studentsDoc[index].id;
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(
                                  data?.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.rollno?.toUpperCase() ?? 'N/A',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      data?.division?.toUpperCase() ?? 'N/A',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  backgroundImage:
                                      NetworkImage(data?.image ?? ''),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        value.updateStudent(
                                          id,
                                          StudentModel(
                                            image: '',
                                            division: '',
                                            name: '',
                                            rollno: '',
                                          ),
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditScreen(
                                              id: id,
                                              student: data,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        bool shouldDelete = await DeleteDialog
                                            .showConfirmationDialog(context);
                                        if (shouldDelete) {
                                          value.deleteStudent(id);
                                        }
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailScreen(student: data),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScreen(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
