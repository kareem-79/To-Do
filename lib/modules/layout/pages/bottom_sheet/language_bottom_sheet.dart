// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class LanguageBottomSheet extends StatelessWidget {
//   const LanguageBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InkWell(
//             onTap: () {
//               context.setLocale(const Locale("ar"));
//               Navigator.pop(context);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("arabic".tr(),
//                     style: context.locale == const Locale("ar")
//                         ? Theme.of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(color: Theme.of(context).primaryColor)
//                         : Theme.of(context).textTheme.bodyMedium),
//                 context.locale == const Locale("ar")
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
//               context.setLocale(const Locale("en"));
//               Navigator.pop(context);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("english".tr(),
//                     style: context.locale == const Locale("en")
//                         ? Theme.of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(color: Theme.of(context).primaryColor)
//                         : Theme.of(context).textTheme.bodyMedium),
//                 context.locale == const Locale("en")
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
