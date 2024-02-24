import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference Student =
      FirebaseFirestore.instance.collection("Student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: Student.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot StudentSnap = snapshot.data!.docs[index];

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 221, 220, 220),
                              blurRadius: 10,
                              spreadRadius: 15)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 30,
                          child: Text(StudentSnap["class"].toString()),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StudentSnap["name"],
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              StudentSnap["phone"].toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              StudentSnap["address"],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            StudentSnap["class"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
