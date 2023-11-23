import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetCountValueBuilderView extends StatelessWidget {
  const GetCountValueBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseDatabase.instance.ref("count").onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var updatedData = Map<String, dynamic>.from(
                  snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
              return Text(updatedData["value"].toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
