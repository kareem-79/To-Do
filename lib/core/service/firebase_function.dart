import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/models/task_model.dart';
import 'package:to_do/core/models/user_model.dart';

class FirebaseFunctions {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<TaskModel> mainTaskFunction() {
    return firestore.collection("Tasks").withConverter(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> mainUserFunction() {
    return firestore.collection("Users").withConverter(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel user) async {
    var ref = mainUserFunction();
    await ref.doc(user.id).set(user);
  }

  static Future<UserModel?> getUser() async {
    String userId=FirebaseAuth.instance.currentUser?.uid??"";
    var ref = mainUserFunction();
    var docRef = await ref.doc(userId).get();
    return docRef.data();
  }

  static Future<void> addTask(TaskModel task) async {
    var ref = mainTaskFunction();
    var docRef = ref.doc();
    task.id = docRef.id;
    task.userId=FirebaseAuth.instance.currentUser?.uid??"";
    return docRef.set(task);
  }

  static Future<void> editTask(TaskModel taskModel) async {
  await FirebaseFirestore.instance
      .collection('Tasks')
      .doc(taskModel.id)
      .update(taskModel.toJson());
  }


  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime time) {
    String userId=FirebaseAuth.instance.currentUser?.uid??"";
    var ref = mainTaskFunction();
    return ref
        .where("date",
            isEqualTo: DateUtils.dateOnly(time).millisecondsSinceEpoch).where("userId",isEqualTo:userId )
        .snapshots();
  }

  static void deleteTask(String id) async {
    var ref = mainTaskFunction();
    await ref.doc(id).delete();
  }

  static Future<void> setDone(TaskModel task) async {
    var ref = mainTaskFunction();
    task.isDone = !task.isDone;
    await ref.doc(task.id).update(task.toJson());
  }

  static createAccount(
      String email, String password, String name, String phone) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      addUser(UserModel(
          id: credential.user?.uid ?? "",
          name: name,
          phone: phone,
          email: email));
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw e;
      print(e);
    } catch (e) {
      throw e;
      print(e);
    }
  }

  static Future<UserCredential> loginAccount(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
