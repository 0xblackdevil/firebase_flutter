import 'package:firebase_demo/service/firebase_firestore.dart';
import 'package:flutter/material.dart';

class PostDataWidget extends StatefulWidget {
  const PostDataWidget({Key? key}) : super(key: key);

  @override
  State<PostDataWidget> createState() => _PostDataWidgetState();
}

class _PostDataWidgetState extends State<PostDataWidget> {
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: titleController,
          )),
          MaterialButton(
            height: 50,
            onPressed: () async {
              await postData(titleController.text, context);
              titleController.clear();
            },
            color: Colors.black,
            child: const Text(
              "Add Data",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
