import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataFromFirestore extends StatefulWidget {
  const GetDataFromFirestore({Key? key}) : super(key: key);

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  Stream<QuerySnapshot<Map<String, dynamic>>> demoCollectionRef =
      FirebaseFirestore.instance.collection("demoCollection").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('demoCollection').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((data) {
                return ListTile(
                  title: Text(data['title'].toString()),
                );
              }).toList(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: SelectableText(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
