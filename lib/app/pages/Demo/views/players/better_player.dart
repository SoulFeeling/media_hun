// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class BetterPlayer extends StatelessWidget {
//   const BetterPlayer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Shortcuts(
//         shortcuts: <LogicalKeySet, Intent>{
//           LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
//         },
//         child: MaterialApp(
//           title: 'Better player demo',
//           localizationsDelegates: [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//           ],
//           supportedLocales: [
//             const Locale('en', 'US'),
//             const Locale('pl', 'PL'),
//           ],
//           theme: ThemeData(
//             primarySwatch: Colors.green,
//           ),
//           home: WelcomePage(),
//         ));
//   }
// }
