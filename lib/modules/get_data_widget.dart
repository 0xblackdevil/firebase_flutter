import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataWidget extends StatefulWidget {
  const GetDataWidget({Key? key}) : super(key: key);

  @override
  State<GetDataWidget> createState() => _GetDataWidgetState();
}

class _GetDataWidgetState extends State<GetDataWidget> {
  Stream<QuerySnapshot<Map<String, dynamic>>> demoCollectionRef =
      FirebaseFirestore.instance.collection('demoCollection').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: demoCollectionRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.docs.map((data) {
              return ListTile(
                title: Text(data['title'].toString()),
                subtitle: Text(data['timeStemp'].toString()),
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
    );
  }
}
