import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

postData(title, context) async {
  await FirebaseFirestore.instance.collection('demoCollection').add({
    'title': title,
    'timeStemp': DateTime.now().toString(),
  }).then((value) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data Added'),
      ),
    );
  }).onError((error, stackTrace) {
    SnackBar(
      content: Text('Error : $error'),
    );
  });
}
