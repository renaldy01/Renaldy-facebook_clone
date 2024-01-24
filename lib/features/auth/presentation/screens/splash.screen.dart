// import 'package:flutter/material.dart';
// import '/core/constants/constants.dart';
// import '/features/auth/presentation/screens/login_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Use a Future.delayed to wait for 5 seconds
//     Future.delayed(Duration(seconds: 5), () {
//       // After 5 seconds, navigate to the LoginScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     });

//     return Scaffold(
//       body: Padding(
//         padding: Constants.defaultPadding,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Image.asset(
//               'assets/icons/fb_logo.png',
//               width: 60,
//             ),
//             Column(
//               children: [
//                 Image.asset(
//                   'assets/icons/meta.png',
//                   height: 50,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
