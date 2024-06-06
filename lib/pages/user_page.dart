import 'package:app_eight_social_app/components%20/my_back_button.dart';
import 'package:app_eight_social_app/components%20/my_list_tile.dart';
import 'package:app_eight_social_app/helper/helper_funtion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            displayMessageToUser("Something went wrong", context);
          }
          // show loading circle
          if (snapshot.data == null) {
            return Text("No Data");
          }
          // get all users
          final users = snapshot.data!.docs;

          return Column(
            children: [
              // back button
              Padding(
                padding: EdgeInsets.only(
                  top: 50.0,
                  left: 25.0,
                ),
                child: Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
              ),
              // list of users in the app
              Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        // get individual user
                        final user = users[index];

                        String username = user["username"];
                        String email = user["email"];

                        return MyListTile(title: username, subTitle: email);
                      }))
            ],
          );
        },
      ),
    );
  }
}
