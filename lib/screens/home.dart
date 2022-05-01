import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/modules/get_data_widget.dart';
import 'package:firebase_demo/modules/post_data_widget.dart';
import 'package:firebase_demo/service/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Flutter Firebase",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Flexible(child: PostDataWidget()),
            Flexible(child: GetDataWidget()),
          ],
        ),
      ),
    );
  }
}
