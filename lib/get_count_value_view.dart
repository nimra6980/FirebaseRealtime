import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetCountValueView extends StatefulWidget {
  const GetCountValueView({super.key});

  @override
  State<GetCountValueView> createState() => _GetCountValueViewState();
}

class _GetCountValueViewState extends State<GetCountValueView> {
  int? count;

  @override
  void initState() {
    super.initState();
    getCountValue();
  }

  getCountValue() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("count");
    var dataSnp = await ref.get();
    var data =
        Map<String, dynamic>.from(dataSnp.value as Map<dynamic, dynamic>);
    print(data);
    setState(() {
      count = data["value"];
    });
    ref.onValue.listen((event) {
      var updatedData = Map<String, dynamic>.from(
          event.snapshot.value as Map<dynamic, dynamic>);
      setState(() {
        count = updatedData["value"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: count != null
            ? Text(count.toString())
            : const CircularProgressIndicator(),
      ),
    );
  }
}
