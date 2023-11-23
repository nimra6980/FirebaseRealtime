import 'package:firebase_database/firebase_database.dart';

saveUser({
  required String name,
  required String phone,
}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$name");
  // ref.update({"email": ""});
  // ref.remove()
  // ref.child("phone").remove();
  await ref.set({"phone": phone});
}
