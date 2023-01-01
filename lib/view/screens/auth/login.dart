import 'package:ecommerce_app/view/widgets/login/bottomcontainer.dart';
import 'package:ecommerce_app/view/widgets/login/buynow.dart';
import 'package:ecommerce_app/view/widgets/login/loginbox.dart';
import 'package:ecommerce_app/view/widgets/login/topcontainer.dart';
import 'package:flutter/material.dart';

late double height;
late double width;

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TopContainer(),
                LoginBox(),
                BuyNow(),
                BottomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*







// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../helper/show_snackbar.dart';
import '../screens/mainscreen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color textColor = Colors.green;
  String? email, password;
  bool isLoading = false;
  bool isLoadingForRecover = false;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isObsecure = true;
  final auth = FirebaseAuth.instance;
  late User user;

  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor = const Color.fromARGB(255, 0, 109, 126);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.center,
            colors: [
              const Color.fromARGB(255, 0, 109, 126),
              const Color.fromARGB(255, 33, 243, 121).withOpacity(0.2),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        radius: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: const FadeInImage(
                            image: AssetImage('assets/images/logo.png'),
                            placeholder: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        'مرحبا بك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ElMessiri',
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: Text(
                        'أدخل بياناتك لتسجيل الدخول',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ElMessiri',
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomTextFormField(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black45,
                        ),
                        TextInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (data) {
                          email = data.trim();
                        },
                        hinttext: 'البريد الإلكتروني',
                      ),
                    ),
                    CustomTextFormField(
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colors.black45,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(
                          isObsecure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black26,
                        ),
                      ),
                      TextInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      isObscure: isObsecure,
                      onChanged: (data) {
                        password = data.trim();
                      },
                      hinttext: 'كلمة المرور',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) {
                                  GlobalKey<FormState> emailController =
                                      GlobalKey();
                                  return Dialog(
                                    backgroundColor: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Form(
                                          key: emailController,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Spacer(
                                                  flex: 3,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 12,
                                                  ),
                                                  child: CustomTextFormField(
                                                    initialtext: email ?? '',
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    TextInputType: TextInputType
                                                        .emailAddress,
                                                    prefixIcon: null,
                                                    hinttext:
                                                        'البريد الإلكتروني',
                                                    onChanged: (data) {
                                                      email = data;
                                                    },
                                                  ),
                                                ),
                                                const Spacer(
                                                  flex: 1,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    if (isLoadingForRecover) {
                                                      return;
                                                    }
                                                    if (emailController
                                                        .currentState!
                                                        .validate()) {
                                                      setState(() {
                                                        isLoadingForRecover =
                                                            true;
                                                      });
                                                      try {
                                                        await FirebaseAuth
                                                            .instance
                                                            .sendPasswordResetEmail(
                                                                email: email!
                                                                    .trim())
                                                            .then((value) =>
                                                                showSnackBar(
                                                                  context,
                                                                  'Password reset email has been sent',
                                                                  Colors.green,
                                                                ));
                                                      } on FirebaseAuthException catch (e) {
                                                        if (e.code ==
                                                            'user-not-found') {
                                                          showSnackBar(
                                                              context,
                                                              'البريد الإلكتروني غير موجود',
                                                              Colors.red);
                                                        } else {
                                                          showSnackBar(
                                                              context,
                                                              e.toString(),
                                                              Colors.red);
                                                        }
                                                        setState(() {
                                                          isLoadingForRecover =
                                                              false;
                                                        });
                                                      }
                                                      setState(() {
                                                        isLoadingForRecover =
                                                            false;
                                                      });
                                                      Navigator.pop(context);
                                                    }

                                                    // recover my password
                                                  },
                                                  child: isLoadingForRecover ==
                                                          false
                                                      ? const Text(
                                                          'استرجاع كلمة المرور',
                                                          style: TextStyle(
                                                            color: Colors.cyan,
                                                            fontFamily: 'Cairo',
                                                            fontSize: 18,
                                                          ),
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CircularProgressIndicator(
                                                              color:
                                                                  kPrimaryColor,
                                                              strokeWidth: 4,
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                                const Spacer(
                                                  flex: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: -80,
                                          child: Image.asset(
                                            'assets/images/reset-password.png',
                                            height: 120,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: isLoadingForRecover == false
                                ? const Text(
                                    'استرجاع كلمة المرور',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'الرجاء الإنتظار',
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CircularProgressIndicator(
                                        color: Colors.black87,
                                        strokeWidth: 2,
                                      ),
                                    ],
                                  ),
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      isLoading: isLoading,
                      text: 'تسجيل الدخول',
                      onTap: () async {
                        if (isLoading) return;
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await loginUser();
                            user = auth.currentUser!;
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainScreen.id,
                              (Route<dynamic> route) => false,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(context,
                                  'البريد الإلكتروني غير موجود', Colors.red);
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(
                                  context, 'كلمة المرور غير صحيحة', Colors.red);
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString(), Colors.red);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterScreen.id);
                            },
                            child: const Text(
                              'انشئ حساب الان',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 16,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          const Text(
                            ' ليس لديك حساب ؟',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email!.trim(), password: password!.trim());
  }
}













*/
