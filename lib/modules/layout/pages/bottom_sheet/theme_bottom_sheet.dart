// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:to_do/modules/layout/manager/provider.dart';
//
// class ThemeBottomSheet extends StatelessWidget {
//   const ThemeBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var pro = Provider.of<MainProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InkWell(
//             onTap: () {
//               pro.changeTheme(ThemeMode.light);
//               Navigator.pop(context);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("light".tr(),
//                     style: pro.mode== (ThemeMode.light)
//                         ? Theme.of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(color: Theme.of(context).primaryColor)
//                         : Theme.of(context).textTheme.bodyMedium),
//                 pro.mode == (ThemeMode.light)
//                     ? Icon(
//                   Icons.done,
//                   size: 30,
//                   color: Theme.of(context).primaryColor,
//                 )
//                     : const SizedBox()
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           InkWell(
//             onTap: () {
//               pro.changeTheme(ThemeMode.dark);
//               Navigator.pop(context);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("dark".tr(),
//                     style: pro.mode == (ThemeMode.dark)
//                         ? Theme.of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(color: Theme.of(context).primaryColor)
//                         : Theme.of(context).textTheme.bodyMedium),
//                 pro.mode == (ThemeMode.dark)
//                     ? Icon(
//                   Icons.done,
//                   size: 30,
//                   color: Theme.of(context).primaryColor,
//                 )
//                     : const SizedBox()
//                 // Icon(Icons.done)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
