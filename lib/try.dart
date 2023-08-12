// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class GetUserName extends StatelessWidget {
  const GetUserName();
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Cards');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('KAzqYJxhptVvm1lB2UeQ').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("Full Name ${data['UserName']}");
          return Text("Full Name: ${data['UserName']} ${data['CardNumber']}");
        }

        return const Text("loading");
      },
    );
  }
}
