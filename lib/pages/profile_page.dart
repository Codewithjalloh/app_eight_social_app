import 'package:app_eight_social_app/components%20/my_back_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future for user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          // data recieved
          else if (snapshot.hasData) {
            // extract data
            Map<String, dynamic>? user = snapshot.data!.data();
            return Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50.0, left: 25.0), child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                //   Profile pic
                  Container(
                    decoration: BoxDecoration,
                  )


                ],
              ),

            )
          }
        },
      ),
    );
  }
}
