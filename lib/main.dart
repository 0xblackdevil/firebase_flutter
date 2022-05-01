import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckFirebaseConnection(),
    );
  }
}

class CheckFirebaseConnection extends StatefulWidget {
  const CheckFirebaseConnection({Key? key}) : super(key: key);

  @override
  State<CheckFirebaseConnection> createState() =>
      _CheckFirebaseConnectionState();
}

class _CheckFirebaseConnectionState extends State<CheckFirebaseConnection> {
  Future<FirebaseApp> firebaseInit = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseInit,
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const HomeScreen();
        } else {
          return textWidget(snapshot.error.toString());
        }
      },
    );
  }
}

textWidget(text) {
  return Scaffold(
    body: Center(
      child: Text(text),
    ),
  );
}
