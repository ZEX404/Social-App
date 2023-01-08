// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/auth/logincontroller.dart';
// import '../../../core/constants/colors.dart';
// import '../../../core/constants/constants.dart';

// late double height;
// late double width;

// class TopContainer extends StatelessWidget {
//   const TopContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;

//     LoginControllerImp controller = Get.put(LoginControllerImp());

//     return Container(
//       height: height / 12,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//       ),
//       alignment: Alignment.center,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: SizedBox(
//                 width: width / 2.5,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.security,
//                       size: 25,
//                       color: AppColors.kTextColor,
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: Text(
//                         rootStatusP != null
//                             ? rootStatusP == true
//                                 ? "Root Access".tr
//                                 : "No Root"
//                             : "Checking",
//                         maxLines: 1,
//                         style: TextStyle(
//                           overflow: TextOverflow.ellipsis,
//                           fontSize: 18,
//                           color: rootStatusP != null
//                               ? rootStatusP == true
//                                   ? Colors.greenAccent
//                                   : Colors.red
//                               : Colors.orange,
//                           fontFamily: 'Cairo',
//                           fontWeight: FontWeight.bold,
//                           shadows: const [
//                             Shadow(
//                                 // bottomLeft
//                                 offset: Offset(-0.5, -0.5),
//                                 color: Colors.black),
//                             Shadow(
//                                 // bottomRight
//                                 offset: Offset(0.5, -0.5),
//                                 color: Colors.black),
//                             Shadow(
//                                 // topRight
//                                 offset: Offset(0.5, 0.5),
//                                 color: Colors.black),
//                             Shadow(
//                                 // topLeft
//                                 offset: Offset(-0.5, 0.5),
//                                 color: Colors.black),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Version : ".tr,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontFamily: 'Cairo',
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                           // bottomLeft
//                           offset: Offset(-0.5, -0.5),
//                           color: Colors.black),
//                       Shadow(
//                           // bottomRight
//                           offset: Offset(0.5, -0.5),
//                           color: Colors.black),
//                       Shadow(
//                           // topRight
//                           offset: Offset(0.5, 0.5),
//                           color: Colors.black),
//                       Shadow(
//                           // topLeft
//                           offset: Offset(-0.5, 0.5),
//                           color: Colors.black),
//                     ],
//                   ),
//                 ),
//                 const Text(
//                   "1.0",
//                   maxLines: 1,
//                   style: TextStyle(
//                     overflow: TextOverflow.ellipsis,
//                     fontSize: 18,
//                     color: AppColors.kTextColor,
//                     fontFamily: 'Cairo',
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                           // bottomLeft
//                           offset: Offset(-0.5, -0.5),
//                           color: Colors.black),
//                       Shadow(
//                           // bottomRight
//                           offset: Offset(0.5, -0.5),
//                           color: Colors.black),
//                       Shadow(
//                           // topRight
//                           offset: Offset(0.5, 0.5),
//                           color: Colors.black),
//                       Shadow(
//                           // topLeft
//                           offset: Offset(-0.5, 0.5),
//                           color: Colors.black),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
