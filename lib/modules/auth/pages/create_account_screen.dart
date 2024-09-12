import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/auth/manager/auth_provider.dart';
import 'package:to_do/modules/auth/pages/login_screen.dart';
import 'package:to_do/modules/auth/pages/widget/costum_text_form_field.dart';
import 'package:to_do/modules/layout/layout_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String routeName = "create";

  CreateAccountScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Container(
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            image: const DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Text("Create Account",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                      const SizedBox(height: 30),
                      CustomText(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Invalid Name";
                          } else {
                            return null;
                          }
                        },
                        controller: provider.nameController,
                        icon: const Icon(Icons.person),
                        hint: "Name",
                        label: "Name",
                      ),
                      const SizedBox(height: 15),
                      CustomText(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Invalid Email";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Email is not correct";
                          } else {
                            return null;
                          }
                        },
                        controller: provider.emailController,
                        icon: const Icon(Icons.email),
                        hint: "Email",
                        label: "Email",
                      ),
                      const SizedBox(height: 15),
                      CustomText(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Invalid phone";
                          } else {
                            return null;
                          }
                        },
                        controller: provider.phoneController,
                        icon: const Icon(Icons.phone),
                        hint: "Phone",
                        label: "Phone",
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Password must be more than 8 Character";
                          } else {
                            return null;
                          }
                        },
                        controller: provider.passwordController,
                        obscureText: provider.isSecure,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.ChangeSecure();
                                },
                                icon: Icon(provider.isSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.blue))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            provider.createAccount(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Create Account",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                              const Icon(Icons.login)
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: const Text("You Have Account...? Login"))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
