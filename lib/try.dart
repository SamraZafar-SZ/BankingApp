// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class GetUserName extends StatelessWidget {
  const GetUserName();
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    db
        .collection("Cards")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) => {
              for (var i in value.docs)
                {
                  print('${i.id} => ${i.data().values.elementAt(2)}'),
                }
            });
    return Container();
  }
}
