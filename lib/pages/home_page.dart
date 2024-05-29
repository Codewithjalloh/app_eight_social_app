import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // firestore access
  final FirebaseFirestore database = FirebaseFirestore();

  // text controler
  final TextEditingController newPostController = TextEditingController();

  // post message functions
  void postMessage() {
    // only post message if there is something in the textfield
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
