// ignore_for_file: file_names

import 'dart:io';
import 'dart:ui';

import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rive/rive.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/scrollbehavier.dart';
import '../../../core/constants/apilinks.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/routes.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/customtextform.dart';

late double height;
late double width;

class ContinueSignUpScreen extends StatefulWidget {
  final String email;
  final String password;

  const ContinueSignUpScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<ContinueSignUpScreen> createState() => _ContinueSignUpScreenState();
}

String? valueChoose;
List listGenders = [
  "Male",
  "Female",
];

class _ContinueSignUpScreenState extends State<ContinueSignUpScreen> {
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;

  fitchImageFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (image == null) {
      return;
    }

    setState(() {
      pickedImage = File(image.path);
    });
  }

  fitchImageFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (image == null) {
      return;
    }

    setState(() {
      pickedImage = File(image.path);
    });
  }

  GlobalKey<FormState> formstate = GlobalKey();

  final Crud _crud = Crud();

  bool isLoading = false;

  late String imageUrl;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp() async {
    try {
      if (formstate.currentState!.validate()) {
        valueChoose = 'Male';
        if (valueChoose == null) {
          _showToast('Select your gender');
        } else {
          if (valueChoose == 'Male') {
            imageUrl = '$uploadServerLink/man.png';
          } else if (valueChoose == 'Female') {
            imageUrl = '$uploadServerLink/woman.png';
          } else {
            imageUrl = '$uploadServerLink/man.png';
          }

          var response = await _crud.postRequest(signupLink, {
            "firstname": firstnameController.text.trim(),
            "lastname": lastnameController.text.trim(),
            "username": usernameController.text.trim(),
            "email": emailController.text.trim(),
            "password": passwordController.text,
            "phone": phoneController.text.trim(),
            "gender": valueChoose,
            "profilepic": imageUrl,
          });

          if (response['status'] == 'success') {
            Get.offAllNamed(AppRoutes.home);
          } else if (response['status'] == 'failure') {
            if (response['message'] == 'Email already exist') {
              // Email already exist
              _showToast("This email is used");
            } else if (response['message'] == 'Phone already exist') {
              // Phone already exist
              _showToast("This phone number is used");
            } else if (response['message'] == 'Username already exist') {
              // Username already exist
              _showToast("This username is used");
            }
          } else {
            // print(response);
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  FToast fToast = FToast();
  _showToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.kBackground.withOpacity(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(
              fontFamily: alexandria,
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    if (mounted) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          fToast.showToast(
            child: toast,
            gravity: ToastGravity.BOTTOM,
            toastDuration: const Duration(milliseconds: 1400),
          );
        },
      );
    }
  }

  @override
  void initState() {
    fToast.init(context);
    emailController.text = widget.email;
    passwordController.text = widget.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back_ios_new,
        //       color: AppColors.kPrimaryColor,
        //     ),
        //   ),
        //   title: Text(
        //     "Sign Up",
        //     style: Theme.of(context).textTheme.displayLarge!.copyWith(
        //           fontSize: 20,
        //         ),
        //   ),
        //   centerTitle: true,
        //   elevation: 0,
        //   backgroundColor: Colors.black,
        // ),
        body: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset('assets/Backgrounds/Spline.png'),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10,
                ),
                // child: SizedBox(),
              ),
            ),
            const RiveAnimation.asset('assets/animations/shapes.riv'),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30,
                ),
                child: const SizedBox(),
              ),
            ),
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.orange,
                          //   width: 0.8,
                          // ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: pickedImage == null
                                            ? valueChoose == 'Female'
                                                ? const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    radius: 75,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/woman.png'),
                                                  )
                                                : const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    radius: 75,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/man.png'),
                                                  )
                                            : CircleAvatar(
                                                backgroundColor:
                                                    Colors.blueGrey,
                                                radius: 75,
                                                backgroundImage:
                                                    FileImage(pickedImage!),
                                              ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Center(
                                          child: SizedBox(
                                            width: width / 1.2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTap: fitchImageFromCamera,
                                                    child: Container(
                                                      // width: 150,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white10,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          25,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 12),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/camera.png',
                                                              height: 20,
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Text(
                                                                'Camera',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  // fontFamily: alexandria,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap:
                                                        fitchImageFromGallery,
                                                    child: Container(
                                                      // width: 150,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white10,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 12),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/add_image.png',
                                                              height: 20,
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Text(
                                                                'Gallery',
                                                                style: TextStyle(
                                                                    color: Colors.black54,
                                                                    // fontFamily: alexandria,
                                                                    fontSize: 16),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Form(
                                  key: formstate,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      CustomTextForm(
                                        TextInputAction: TextInputAction.next,
                                        hintText: "Enter your Email",
                                        label: "Email",
                                        icon: Icons.email_outlined,
                                        myController: emailController,
                                        validator: (val) {
                                          return validInput(
                                              val!, 0, 100, "email");
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextForm(
                                        isObsecure: true,
                                        TextInputAction: TextInputAction.done,
                                        hintText: "Enter your Password",
                                        label: "Password",
                                        icon: Icons.lock_outlined,
                                        myController: passwordController,
                                        validator: (val) {
                                          return validInput(
                                              val!, 6, 100, "password");
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextForm(
                                        TextInputAction: TextInputAction.next,
                                        hintText: "Enter your fisrt name",
                                        label: "Fisrt Name",
                                        icon: Icons.notes,
                                        myController: firstnameController,
                                        validator: (val) {
                                          return validInput(
                                              val!, 1, 20, "name");
                                        },
                                        iconData: '',
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextForm(
                                        TextInputAction: TextInputAction.next,
                                        hintText: "Enter your last name",
                                        label: "Last Name",
                                        icon: Icons.notes,
                                        myController: lastnameController,
                                        validator: (val) {
                                          return validInput(
                                              val!, 1, 20, "name");
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      // CustomTextForm(
                                      //   TextInputAction: TextInputAction.next,
                                      //   hintText: "Enter your Phone",
                                      //   label: "Phone",
                                      //   icon: Icons.phone,
                                      //   myController: phoneController,
                                      //   validator: (val) {
                                      //     return validInput(
                                      //         val!, 0, 20, "phone");
                                      //   },
                                      // ),
                                      // const SizedBox(height: 20),
                                      // CustomTextForm(
                                      //   TextInputAction: TextInputAction.next,
                                      //   hintText: "Enter A Username",
                                      //   label: "Username",
                                      //   icon: Icons.perm_identity,
                                      //   myController: usernameController,
                                      //   validator: (val) {
                                      //     return validInput(
                                      //         val!, 5, 20, "username");
                                      //   },
                                      // ),
                                      // const SizedBox(height: 20),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     border: Border.all(
                                      //       color: AppColors.kTextColor
                                      //           .withOpacity(0.5),
                                      //       width: 0.5,
                                      //     ),
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //   ),
                                      //   child: Row(
                                      //     children: [
                                      //       Padding(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 10.0),
                                      //         child: valueChoose == null
                                      //             ? Image.asset(
                                      //                 'assets/images/gender.png',
                                      //                 height: 25,
                                      //               )
                                      //             : valueChoose == 'Male'
                                      //                 ? Image.asset(
                                      //                     'assets/images/male.png',
                                      //                     height: 25,
                                      //                   )
                                      //                 : Image.asset(
                                      //                     'assets/images/female.png',
                                      //                     height: 25,
                                      //                   ),
                                      //       ),
                                      //       const SizedBox(
                                      //         width: 8,
                                      //       ),
                                      //       Expanded(
                                      //         child: DropdownButton(
                                      //           hint: Center(
                                      //             child: Text(
                                      //               'Select your gender',
                                      //               style: TextStyle(
                                      //                   color: AppColors
                                      //                       .kTextColor,
                                      //                   fontFamily: alexandria,
                                      //                   fontSize: 20),
                                      //             ),
                                      //           ),
                                      //           elevation: 0,
                                      //           borderRadius:
                                      //               BorderRadius.circular(5),
                                      //           dropdownColor: Colors
                                      //               .transparent
                                      //               .withOpacity(0.8),
                                      //           icon: const Icon(
                                      //             Icons.arrow_drop_down,
                                      //             color: AppColors.kTextColor,
                                      //           ),
                                      //           iconSize: 36,
                                      //           isExpanded: true,
                                      //           underline: const SizedBox(),
                                      //           value: valueChoose,
                                      //           onChanged: (newValue) {
                                      //             setState(() {
                                      //               valueChoose =
                                      //                   newValue as String?;
                                      //             });
                                      //           },
                                      //           items: listGenders
                                      //               .map((valueItem) {
                                      //             return DropdownMenuItem(
                                      //               value: valueItem,
                                      //               child: Center(
                                      //                 child: Text(
                                      //                   valueItem,
                                      //                   style: TextStyle(
                                      //                       color: AppColors
                                      //                           .kTextColor,
                                      //                       fontFamily:
                                      //                           alexandria,
                                      //                       fontSize: 20),
                                      //                 ),
                                      //               ),
                                      //             );
                                      //           }).toList(),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   height: 8,
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      // width: width,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width:
                            isLoading ? 50 : MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          onPressed: () async {
                            if (isLoading == false) {
                              if (mounted) {
                                setState(() {
                                  isLoading = true;
                                });
                              }
                              await signUp();
                            }
                          },
                          // splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                            side: const BorderSide(
                              color: AppColors.kBackground,
                            ),
                          ),
                          elevation: 0,
                          color: isLoading
                              ? Colors.transparent
                              : AppColors.kPrimaryColor,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.kPrimaryColor,
                                )
                              : Text(
                                  "Sign up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontFamily: alexandria,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
