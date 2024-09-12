import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/service/firebase_function.dart';
import 'package:to_do/modules/layout/layout_screen.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecure = true;

  ChangeSecure() {
    isSecure = !isSecure;
    notifyListeners();
  }

  void createAccount(BuildContext context) async {
    UserCredential credential = await FirebaseFunctions.createAccount(
        emailController.text,
        passwordController.text,
        nameController.text,
        phoneController.text);
    if (credential.user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, LayoutScreen.routeName, (route) => false);
    }
  }

  void login(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseFunctions.loginAccount(
          emailController.text, passwordController.text);
      if (credential.user != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, LayoutScreen.routeName, (route) => false);
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Welcome',
            message: 'Welcome',
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: 'Email or Password is not correct',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
