import 'package:barcode_generator/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class FirebaseDb {
  static CollectionReference user =
      FirebaseFirestore.instance.collection("Registered_Users");

  static final auth = FirebaseAuth.instance;

  static Future<bool> getUser({
    required userEmail,
    required userPassword,
  }) async {
    try {
      final logUser = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return true;
    } catch (e) {
      print('Error logign user $e');
      return false;
    }
  }

  static Future<bool> createUser(
      {required userName, required userEmail, required userPassword}) async {
    try {
      final UserCredential checkUser =
          await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      addToDb(userName: userName, userEmail: userEmail);
      return true;
    } catch (e) {
      print("some error occured $e");
      return false;
    }
  }

  static Future<void> addToDb({required userName, required userEmail}) async {
    String userId = auth.currentUser!.uid;
    final userData = UserModel(
      userId: userId,
      userName: userName,
      userEmail: userEmail,
    );

    final getData = userData.toJson();

    await user.doc(userId).set(getData).then((value) {
      print("user added successfully ");
    }).catchError((error) {
      print("error occired $error");
    });
  }
}
