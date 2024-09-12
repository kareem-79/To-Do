import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/models/task_model.dart';
import 'package:to_do/core/models/user_model.dart';
import 'package:to_do/core/service/firebase_function.dart';
import 'package:to_do/modules/auth/pages/login_screen.dart';
import 'package:to_do/modules/layout/pages/setting_screen.dart';
import 'package:to_do/modules/layout/pages/task_screen.dart';

class MainProvider extends ChangeNotifier {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDatePiker = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  List<Widget> screens = [const TaskScreen(), const SettingScreen()];

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  UserModel? user;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void setDate(DateTime dateTime) {
    selectedDate = dateTime;
    notifyListeners();
  }

  void setDatePiker(DateTime dateTime) {
    selectedDatePiker = dateTime;
    notifyListeners();
  }

  void addTask() async {
    TaskModel taskModel = TaskModel(
        title: titleController.text,
        desc: descController.text,
        time: "${time.hour}:${time.minute}",
        date: DateUtils.dateOnly(selectedDatePiker).millisecondsSinceEpoch,
        isDone: false);
    await FirebaseFunctions.addTask(taskModel);
    titleController.clear();
    descController.clear();
  }

  void editTasks(TaskModel taskModel) async {
    TaskModel updatedTaskModel = TaskModel(
        id: taskModel.id,
        title: titleController.text.isNotEmpty
            ? titleController.text
            : taskModel.title,
        desc: descController.text.isNotEmpty
            ? descController.text
            : taskModel.desc,
        time: "${time.hour}:${time.minute}",
        date: DateUtils.dateOnly(selectedDatePiker).millisecondsSinceEpoch,
        isDone: taskModel.isDone);
    await FirebaseFunctions.editTask(updatedTaskModel);
    titleController.clear();
    descController.clear();
  }

  Stream<QuerySnapshot<TaskModel>> getTask() {
    return FirebaseFunctions.getTasks(selectedDate);
  }

  void deleteTask(String id) async {
    FirebaseFunctions.deleteTask(id);
    notifyListeners();
  }

  void setDone(TaskModel task) async {
    FirebaseFunctions.setDone(task);
  }

  void setTime(TimeOfDay value) {
    time = value;
    notifyListeners();
  }

  void getUser() async {
    user = await FirebaseFunctions.getUser();
    notifyListeners();
  }

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }
}
