import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/layout/manager/provider.dart';
import 'bottom_sheet/language_bottom_sheet.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MainProvider>(context);
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Setting",style: Theme.of(context).textTheme.bodyLarge,),
            ),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
            ),
            toolbarHeight: 150,
            actions: [
              IconButton(
                  onPressed: () {
                    provider.logout(context);
                  },
                  icon: const Icon(Icons.logout)),
            ],

          ),
          // body: Padding(
          //   padding: const EdgeInsets.all(30.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text("Mode"),
          //       const SizedBox(
          //         height: 5,
          //       ),
          //       // InkWell(
          //       //   onTap: () {
          //       //     showModalBottomSheet(
          //       //       shape: RoundedRectangleBorder(
          //       //           borderRadius: BorderRadius.circular(30)),
          //       //       context: context,
          //       //       builder: (context) {
          //       //         return const ThemeBottomSheet();
          //       //       },
          //       //     );
          //       //   },
          //       //   child: Container(
          //       //     padding: const EdgeInsets.all(8.0),
          //       //     width: double.infinity,
          //       //     decoration: BoxDecoration(
          //       //         borderRadius: BorderRadiusDirectional.circular(22),
          //       //         border: Border.all(color: Theme.of(context).primaryColor)),
          //       //     child: Text(
          //       //         MainProvider.mode == (ThemeMode.light) ? "light" : "dark"),
          //       //   ),
          //       // ),
          //       const SizedBox(height: 30),
          //       const Text("language"),
          //       const SizedBox(
          //         height: 5,
          //       ),
          //       // InkWell(
          //       //   onTap: () {
          //       //     showModalBottomSheet(
          //       //       shape: RoundedRectangleBorder(
          //       //           borderRadius: BorderRadius.circular(30)),
          //       //       context: context,
          //       //       builder: (context) {
          //       //         return const LanguageBottomSheet();
          //       //       },
          //       //     );
          //       //   },
          //       //   child: Container(
          //       //     padding: const EdgeInsets.all(8.0),
          //       //     width: double.infinity,
          //       //     decoration: BoxDecoration(
          //       //         borderRadius: BorderRadius.circular(22),
          //       //         border: Border.all(color: Theme.of(context).primaryColor)),
          //       //     child: Text(context.locale == const Locale("en")
          //       //         ? "english"
          //       //         : "arabic"),
          //       //   ),
          //       // )
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
