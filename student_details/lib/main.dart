import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/controller/image_provider.dart';
import 'package:student_details/controller/student_provider.dart';
import 'package:student_details/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCvRBoFZ0HMg-CfIAnQR72IY4cHnnos8GU',
    appId: '1:352199373535:android:0f35aa20264485361d6f6a',
    messagingSenderId: '352199373535',
    projectId: 'student-details-app-c6330',
    storageBucket: 'student-details-app-c6330.appspot.com',
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        ChangeNotifierProvider(create: (context) => ImageProviderr())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
