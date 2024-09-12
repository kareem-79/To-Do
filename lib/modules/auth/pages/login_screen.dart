import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/auth/manager/auth_provider.dart';
import 'package:to_do/modules/auth/pages/create_account_screen.dart';
import 'package:to_do/modules/auth/pages/widget/costum_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text("Login",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    const SizedBox(height: 30),
                    CustomText(
                      controller: provider.emailController,
                      icon: const Icon(Icons.email),
                      hint: "Email",
                      label: "Email",
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
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
                        provider.login(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Login",
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
                              context, CreateAccountScreen.routeName);
                        },
                        child: const Text(
                            "You Don't Have Account...? Create Account"))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
