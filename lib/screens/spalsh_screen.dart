// import 'package:flutter/material.dart';
//
// class SpalshScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ,
//     );
//   }
//
// }
//
// class Splash extends StatelessWidget {
//   Widget build(BuildContext context) {
//     bool lightMode =
//         MediaQuery.of(context).platformBrightness == Brightness.light;
//     return Scaffold(
//       backgroundColor: lightMode
//           ? const Color(0x00e1f5fe).withOpacity(1.0)
//           : const Color(0x00042a49).withOpacity(1.0),
//       body: Center(
//           child: lightMode
//               ? Image.asset('assets/splash.png')
//               : Image.asset('assets/splash_dark.png')),
//     );
//   }
// }